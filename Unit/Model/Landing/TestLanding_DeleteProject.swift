import XCTest
@testable import catban

class TestLanding_DeleteProject:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var project:Project!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = Project()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.board = MockBoardProtocol()
        self.model.board = self.board
        self.model.project = project
        self.model.board.projects = [project]
        self.model.viewModelLoader = self.viewModelLoader
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.board, "Failed to load board")
    }
    
    func testThrowsWhenOnlyOneProject() {
        XCTAssertThrowsError(try self.model.deleteProject(), "Failed to throw when less than 2 projects")
    }
    
    func testNoThrowsWhenMoreThanOneProject() {
        self.model.board.projects.append(Project())
        XCTAssertNoThrow(try self.model.deleteProject(), "Failed to delete project")
    }
    
    func testCallsDeleteOnBoard() {
        self.model.board.projects.append(Project())
        self.startExpectation()
        self.board.onDeleteProject = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNoThrow(try self.model.deleteProject(), "Failed to delete project")
        
        self.waitExpectations()
    }
    
    func testReloadViewModelAfterDelete() {
        self.model.board.projects.append(Project())
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNoThrow(try self.model.deleteProject(), "Failed to delete project")
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
