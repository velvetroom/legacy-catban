import XCTest
@testable import catban

class TestLandingController:XCTestCase {
    private var controller:LandingController!
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.outlets, "Controller doesn't have outlets")
    }
    
    func testOutletsAreLoaded() {
        XCTAssertNotNil(self.controller.view, "Unable to load view from controller")
        XCTAssertNotNil(self.controller.title, "Controller title not loaded")
        XCTAssertNotNil(self.controller.outlets.imageLogo, "Image logo not loaded")
        XCTAssertNotNil(self.controller.outlets.imageLogo.image, "Image logo doesn't have an image")
        XCTAssertNotNil(self.controller.outlets.viewCollection, "View collection not loaded")
    }
}
