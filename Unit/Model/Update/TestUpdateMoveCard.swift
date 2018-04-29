import XCTest
@testable import catban

class TestUpdateMoveCard:XCTestCase {
    private var update:UpdateMoveCard!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var history:MockHistoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let origin:IndexPath = IndexPath(item:11, section:0)
        static let destination:IndexPath = IndexPath(item:22, section:0)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = UpdateMoveCard()
        self.view = MockLandingViewCollection()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.history = MockHistoryProtocol()
        self.board.project = self.project
        self.project.history = self.history
        self.update.origin = Constants.origin
        self.update.destination = Constants.destination
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.history, "Failed to load history")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onMoveItem = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin")
            XCTAssertEqual(destination, Constants.destination, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        self.waitExpectation()
    }
    
    func testStrategyBoardInsertCard() {
        self.startExpectation()
        self.project.onMoveCard = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin")
            XCTAssertEqual(destination, Constants.destination, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        self.waitExpectation()
    }
    
    func testStrategyBoardSavesProject() {
        self.startExpectation()
        self.board.onSaveProject = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
