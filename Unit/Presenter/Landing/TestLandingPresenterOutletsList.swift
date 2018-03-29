import XCTest
@testable import catban

class TestLandingPresenterOutletsList:XCTestCase {
    private var outlets:LandingPresenterOutletsList!
    
    override func setUp() {
        super.setUp()
        self.outlets = LandingPresenterOutletsList()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.outlets, "Failed to load outlets")
        XCTAssertNil(self.outlets.viewCollection, "Collection should not exist")
        XCTAssertNil(self.outlets.layoutCollection, "Layout collection should not exist")
        XCTAssertNil(self.outlets.gestureCollection, "Gesture collection should not exist")
        XCTAssertNil(self.outlets.imageLogo, "Image logo should not exist")
        XCTAssertNil(self.outlets.viewCollectionMenu, "Collection menu should not exist")
        XCTAssertNil(self.outlets.layoutCollectionMenuBottom, "Layout should not exist")
    }
}
