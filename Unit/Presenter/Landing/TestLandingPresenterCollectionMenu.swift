import XCTest
@testable import catban

class TestLandingPresenterCollectionMenu:XCTestCase {
    private var presenter:LandingPresenterCollectionMenu!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionMenu()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
