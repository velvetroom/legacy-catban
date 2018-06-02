import XCTest
@testable import Board

class TestProjectManaged:XCTestCase {
    private var model:ProjectManaged!
    
    override func setUp() {
        super.setUp()
        self.model = ProjectManaged()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.manager, "Failed to load manager")
    }
}
