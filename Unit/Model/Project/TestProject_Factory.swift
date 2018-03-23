import XCTest
@testable import catban

class TestProject_Factory:XCTestCase {
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryNewProject()
    }
    
    func testFactory() {
        XCTAssertNotNil(self.project, "Failed to factorise new project")
        XCTAssertFalse(self.project.name.isEmpty, "Failed to assign default name")
        XCTAssertFalse(self.project.columns.isEmpty, "Failed to assign default columns")
    }
    
    func testFactoryColumns() {
        let columns:[ProjectColumn] = Project.factoryDefaultColumns()
        XCTAssertNotNil(columns, "Failed to factory columns")
    }
}
