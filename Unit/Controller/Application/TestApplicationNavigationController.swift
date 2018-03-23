import XCTest
@testable import catban

class TestApplicationNavigationController:XCTestCase {
    private var controller:ApplicationNavigationController!
    
    override func setUp() {
        super.setUp()
        self.controller = ApplicationNavigationController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}
