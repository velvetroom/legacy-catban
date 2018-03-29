import XCTest
@testable import catban

class TestLandingPresenterOutlets:XCTestCase {
    private var presenter:LandingPresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
