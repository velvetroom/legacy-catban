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
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.countProjects, "Failed to load count projects")
        XCTAssertNotNil(self.model.projects, "Failed to load projects")
    }
}
