import XCTest
@testable import catban

class TestStats:XCTestCase {
    private var model:Stats!
    private var presenter:MockStatsPresenterProtocol!
    private var board:Board!
    private var expectedItems:[StatsItemProtocol.Type]!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Stats()
        self.board = Board()
        self.presenter = MockStatsPresenterProtocol()
        self.model.presenter = self.presenter
        self.model.board = self.board
        self.expectedItems = [
            StatsItemCompletion.self,
            StatsItemSpeed.self]
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load stats")
        XCTAssertNotNil(self.model.items, "Failed to load items")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.expectedItems, "Failed to load expected items")
    }
    
    func testReloadViewModel() {
        self.startExpectation()
        self.presenter.onUpdateWidthBoard = { [weak self] (board:BoardProtocol) in
            let board:Board = board as! Board
            XCTAssertTrue(board === self?.board, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.model.reloadViewModel()
        self.waitExpectations()
    }
    
    func testFactory() {
        self.validateItems(items:self.model.items)
    }
    
    private func validateItems(items:[StatsItemProtocol]) {
        for item:StatsItemProtocol in items {
            let itemType:StatsItemProtocol.Type = type(of:item)
            let countItems:Int = self.expectedItems.count
            XCTAssertGreaterThan(countItems, 0, "Received more items than expected")
            for index:Int in 0 ..< countItems {
                if itemType == self.expectedItems[index] {
                    self.expectedItems.remove(at:index)
                    break
                }
            }
        }
        XCTAssertTrue(self.expectedItems.isEmpty, "There are some expected items not found")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
