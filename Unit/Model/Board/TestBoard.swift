import XCTest
@testable import catban

class TestBoard:XCTestCase {
    private var model:Board!
    
    override func setUp() {
        super.setUp()
        self.model = Board()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.projects, "Failed to load projects")
        XCTAssertNotNil(self.model.user, "Failed to load user")
        XCTAssertNotNil(self.model.project, "Failed to load project")
    }
    
    func testUpdateProject() {
        let project:Project = Project()
        
        self.model.project = project
        
        guard
            let userProject:Project = self.model.user.project as? Project
        else {
            return
        }
        XCTAssertTrue(userProject === project, "Failed to assign project to user")
    }
    
    func testRetrieveProject() {
        let project:Project = Project()
        
        self.model.user.project = project
        
        guard
            let boardProject:Project = self.model.project as? Project
        else {
            return
        }
        XCTAssertTrue(boardProject === project, "Failed to retrieve project from user")
    }
}
