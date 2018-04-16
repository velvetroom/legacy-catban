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
    }
}
