import XCTest
@testable import catban

class TestLandingViewModelLoaderOutlets_CollectionMenu:XCTestCase {
    private var loader:LandingViewModelLoaderOutlets!
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
}
