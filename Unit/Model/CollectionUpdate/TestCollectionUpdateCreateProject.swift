import XCTest
@testable import catban

class TestCollectionUpdateCreateProject:XCTestCase {
    private var update:CollectionUpdateCreateProject!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateCreateProject()
        self.view = MockLandingViewCollection()
        self.board = MockBoardProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.update.project, "Failed to load project")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onReloadDataCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyBoardInsertsProject() {
        self.startExpectation()
        self.board.onInserProject = { [weak self] (project:ProjectProtocol) in
            XCTAssertEqual(project.identifier, self?.update.project.identifier,
                           "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        
        self.waitExpectation()
    }
    
    func testStrategyBoardUpdatesProject() {
        self.update.strategy(board:self.board)
        XCTAssertEqual(self.board.project.identifier, self.update.project.identifier,
                       "Failed to update current project")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
