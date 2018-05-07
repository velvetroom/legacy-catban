import XCTest
@testable import Board

class TestProject:XCTestCase {
    private var model:Project!
    
    override func setUp() {
        super.setUp()
        self.model = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.countColumns, "Failed to load count columns")
        XCTAssertNotNil(self.model.columns, "Failed to load columns")
        XCTAssertNotNil(self.model.name, "Failed to load name")
    }
    
    func testCopyIdentifier() {
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        let projectB:ProjectProtocol = ProjectFactory.blankProject()
        projectB.copy(project:projectA)
        XCTAssertEqual(projectA.identifier, projectB.identifier, "Failed to copy identifier")
    }
    
    func testCopyCreated() {
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        let projectB:ProjectProtocol = ProjectFactory.blankProject()
        projectB.copy(project:projectA)
        XCTAssertEqual(projectA.created, projectB.created, "Failed to copy created")
    }
    
    func testCopyColumns() {/*
        let projectA:ProjectProtocol = ProjectFactory.newProject()

        
        
        let projectB:ProjectProtocol = ProjectFactory.blankProject()
        projectB.copy(project:projectA)
        XCTAssertEqual(projectA.identifier, projectB.identifier, "Failed to copy identifier")*/
    }
}
