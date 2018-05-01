import XCTest
@testable import catban

class TestLanding:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectedIndexPath:IndexPath = IndexPath(item:9342, section:94323)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.model.editingCard = Constants.expectedIndexPath
        self.model.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.board, "Failed to load board")
        XCTAssertNotNil(self.model.editingCard, "Editing cell property not found")
        XCTAssertNotNil(self.model.editingCardReference, "Card reference property not found")
        XCTAssertNotNil(self.model.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.model.update, "Failed to load factory")
        XCTAssertNotNil(self.model.state, "Failed to load state")
        XCTAssertNotNil(self.model.state.delegate, "Failed to assign delegate to state")
    }
    
    func testEditingCardReference() {
        self.startExpectation()
        self.project.onCardAtIndex = { [weak self] (indexPath:IndexPath) in
            XCTAssertEqual(indexPath, Constants.expectedIndexPath, "Invalid index path")
            self?.expect?.fulfill()
        }
        
        let _:ProjectCard? = self.model.editingCardReference
        
        self.waitExpectation()
    }
    
    func testUpdateProject() {
        let project:Project = Project()
        
        self.model.project = project
        
        guard
            let boardProject:Project = self.model.board.project as? Project
        else { return }
        
        XCTAssertTrue(boardProject === project, "Failed to update board project")
    }
    
    func testRetrieveProject() {
        let project:Project = Project()
        self.model.board.project = project
        
        guard
            let landingProject:Project = self.model.project as? Project
        else { return }
        
        XCTAssertTrue(landingProject === project, "Failed to retrieve landing project")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
