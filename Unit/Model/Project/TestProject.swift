import XCTest
@testable import catban

class TestProject:XCTestCase {
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.project.columns, "Failed to load columns")
        XCTAssertNotNil(self.project.name, "Project has not name")
    }
}
