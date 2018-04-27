import XCTest
@testable import catban

class TestUpdateDeleteSections:XCTestCase {
    private var update:UpdateDeleteSections!
    private var view:MockLandingViewCollection!
    private var board:Board!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let index:Int = 2355
    }
    
    override func setUp() {
        super.setUp()
        self.update = UpdateDeleteSections()
        self.view = MockLandingViewCollection()
        self.board = Board()
        self.project = MockProjectProtocol()
        self.board.project = self.project
        self.update.index = Constants.index
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.update.index, "Failed to load index")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onDeleteSections = { [weak self] (indexes:IndexSet) in
            XCTAssertEqual(indexes.first, Constants.index, "Invalid index set")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyProject() {
        self.startExpectation()
        self.project.onDeleteColumnAt = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.index, "Invalid index")
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
