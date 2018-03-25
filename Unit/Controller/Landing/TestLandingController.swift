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
        XCTAssertNotNil(self.controller.projectLoader, "Controller doesn't have project loader")
        XCTAssertNotNil(self.controller.viewModelLoader, "Controller doesn't have view model loader")
        XCTAssertNotNil(self.controller.collectionDelegate, "Controller doesn't have a collection delegate")
    }
    
    func testOutletsAreLoaded() {
        XCTAssertNotNil(self.controller.view, "Unable to load view from controller")
        XCTAssertNotNil(self.controller.title, "Controller title not loaded")
        XCTAssertNotNil(self.controller.outlets.imageLogo, "Image logo not loaded")
        XCTAssertNotNil(self.controller.outlets.imageLogo.image, "Image logo doesn't have an image")
        XCTAssertNotNil(self.controller.outlets.viewCollection, "View collection not loaded")
        XCTAssertNotNil(self.controller.outlets.viewCollection.delegate, "Collection has no delegate")
        XCTAssertNotNil(self.controller.outlets.viewCollection.dataSource, "Collection has no data source")
    }
}
