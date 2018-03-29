import XCTest
@testable import catban

class TestLandingPresenter:XCTestCase {
    private var presenter:LandingPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.collection, "Failed to load collection")
        XCTAssertNotNil(self.presenter.collectionMenuAnimation, "Failed to load collection menu animation")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load presenter")
    }
}
