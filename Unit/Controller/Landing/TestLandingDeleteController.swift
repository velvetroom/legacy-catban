import XCTest
@testable import catban

class TestLandingDeleteController:XCTestCase {
    private var controller:LandingDeleteController!
    
    override func setUp() {
        super.setUp()
        self.controller = LandingDeleteController()
    }
    
    func testLoad() {
        XCTAssertNil(self.controller, "Failed to load controller")
    }
}
