import XCTest
@testable import Board

class TestBoard:XCTestCase {
    private var model:Board!
    
    override func setUp() {
        super.setUp()
        self.model = Board()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.identifier, "Failed to load identifier")
        XCTAssertNotNil(self.model.countProjects, "Failed to load count projects")
        XCTAssertNotNil(self.model.projects, "Failed to load projects")
    }
    
    func testCountProjects() {
        XCTAssertEqual(self.model.projects.count, self.model.countProjects, "Invalid count projects")
    }
    
    func testCountProjectsAfterAdding() {
        self.model.projects.append(Project())
        XCTAssertEqual(self.model.projects.count, self.model.countProjects, "Invalid count projects")
    }
}
