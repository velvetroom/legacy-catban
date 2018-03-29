import XCTest
@testable import catban

class TestLandingPresenterCollectionMenuAnimation:XCTestCase {
    private var presenter:LandingPresenterCollectionMenuAnimation!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionMenuAnimation()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
