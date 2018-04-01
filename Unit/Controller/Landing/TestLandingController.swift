import XCTest
@testable import catban

class TestLandingController:XCTestCase {
    private var controller:LandingController!
    private var outlets:LandingPresenterOutletsList {
        get {
            return self.controller.model.presenter.outlets.list
        }
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model.projectLoader, "Controller doesn't have project loader")
        XCTAssertNotNil(self.controller.model.viewModelLoader, "Controller doesn't have view model loader")
        XCTAssertNotNil(self.controller.model.presenter, "Controller doesn't have a collection delegate")
    }
    
    func testOutletsAreLoaded() {
        XCTAssertNotNil(self.controller.view, "Unable to load view from controller")
        XCTAssertNotNil(self.controller.title, "Controller title not loaded")
        XCTAssertNotNil(self.outlets.controller, "Controller not loaded")
        XCTAssertNotNil(self.outlets.imageLogo, "Image logo not loaded")
        XCTAssertNotNil(self.outlets.imageLogo?.image, "Image logo doesn't have an image")
        XCTAssertNotNil(self.outlets.viewCollection, "View collection not loaded")
        XCTAssertNotNil(self.outlets.viewCollection?.delegate, "Collection has no delegate")
        XCTAssertNotNil(self.outlets.viewCollection?.dataSource, "Collection has no data source")
        XCTAssertNotNil(self.outlets.viewCollectionMenu, "Collection menu not loaded")
        XCTAssertNotNil(self.outlets.layoutCollectionMenuBottom, "Layout not loaded")
        XCTAssertNotNil(self.outlets.buttonCollectionMenuMoveRight, "Button not loaded")
        XCTAssertNotNil(self.outlets.buttonCollectionMenuMoveRight, "Button not loaded")
        XCTAssertNotNil(self.outlets.gestureCollection, "Gesture not loaded")
        XCTAssertNotNil(self.outlets.gestureCollection?.delegate, "Gesture has no delegate")
        XCTAssertNotNil(self.outlets.layoutCollection, "Layout wasn't loaded")
        XCTAssertNotNil(self.controller.model.presenter.collection.dataSource.delegate, "Delegate not assigned")
        XCTAssertNotNil(self.controller.model.presenter.collection.delegate.delegate, "Delegate not assigned")
        XCTAssertFalse(self.outlets.viewCollection!.gestureRecognizers!.isEmpty, "No gestures found")
    }
}
