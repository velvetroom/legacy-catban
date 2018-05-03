import XCTest
@testable import catban

class TestLanding_UpdateProject:XCTestCase {
    private var model:Landing!
    private var project:Project!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var board:MockBoardProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let originalName:String = "hello world"
        static let newName:String = "lorem ipsum"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = Project()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.board = MockBoardProtocol()
        self.model.board = self.board
        self.model.viewModelLoader = self.viewModelLoader
        self.model.project = project
        self.project.name = Constants.originalName
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
    }
    
    func testOriginalName() {
        XCTAssertEqual(self.project.name, Constants.originalName, "Invalid initial name")
    }
    
    func testUpdateProjectName() {
        self.model.updateProject(name:Constants.newName)
        XCTAssertEqual(self.project.name, Constants.newName, "Failed to update name")
    }
    
    func testReloadsViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.updateProject(name:Constants.newName)
        self.waitExpectations()
    }
    
    func testSavesProject() {
        self.startExpectation()
        self.board.onSaveProject = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.updateProject(name:Constants.newName)
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
