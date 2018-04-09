import XCTest
@testable import catban

class TestLandingColumnEditController:XCTestCase {
    private var controller:LandingColumnEditController!
    
    override func setUp() {
        super.setUp()
        self.controller = LandingColumnEditController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}
