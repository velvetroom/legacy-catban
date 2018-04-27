import XCTest
@testable import catban

class TestUpdateCreateProject:XCTestCase {
    private var update:UpdateCreateProject!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = UpdateCreateProject()
        self.view = MockLandingViewCollection()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.board.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.update.project, "Failed to load project")
    }
    
    func testConfiguration() {
        XCTAssertFalse(self.update.project.identifier.isEmpty, "Failed to assign identifier")
        XCTAssertFalse(self.update.project.name.isEmpty, "Failed to assign name")
        XCTAssertFalse(self.update.project.columns.isEmpty, "Failed to add at least 1 column")
        XCTAssertFalse(self.update.project.columns[0].name.isEmpty, "Failed to assign name to first column")
    }
    
    func testStrategyBoardInsertsProject() {
        self.startExpectation()
        self.board.onInsertProject = { [weak self] (project:ProjectProtocol) in
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
