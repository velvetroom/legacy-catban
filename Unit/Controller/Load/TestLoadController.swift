import XCTest
@testable import catban

class TestLoadController:XCTestCase {
    private var controller:LoadController!
    
    override func setUp() {
        super.setUp()
        self.controller = LoadController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model, "Failed to load model")
    }
    
    func testAddTitle() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.controller.title, "Failed to assign title")
    }
}
