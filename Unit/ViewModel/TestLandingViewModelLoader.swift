import XCTest
@testable import catban

class TestLandingViewModelLoader:XCTestCase {
    private var loader:LandingViewModelLoader!
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoader()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
}
