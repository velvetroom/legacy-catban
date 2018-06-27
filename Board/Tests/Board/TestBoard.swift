import XCTest
@testable import Board

class TestBoard:XCTestCase {
    private var model:Board!
    private struct Constants {
        static let identifier:String = "hello world"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.model.identifier = Constants.identifier
    }
    
    func testCountProjects() {
        XCTAssertEqual(self.model.countProjects, 0, "Should have no projects")
        let project:Project = Project()
        project.identifier = "lorem ipsum"
        self.model.add(project:project)
        XCTAssertEqual(self.model.countProjects, 1, "Should have 1 project")
    }
}
