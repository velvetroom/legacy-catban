import XCTest
@testable import catban

class TestLandingViewModelLoaderCollectionMenu:XCTestCase {
    private var loader:LandingViewModelLoaderCollectionMenu!
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderCollectionMenu()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
}
