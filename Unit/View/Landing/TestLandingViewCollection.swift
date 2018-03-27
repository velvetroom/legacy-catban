import XCTest
@testable import catban

class TestLandingViewCollection:XCTestCase {
    private var view:LandingViewCollection!
    private var delegate:MockLandingPresenterCollection!
    
    override func setUp() {
        super.setUp()
        self.view = LandingViewCollection()
        self.delegate = MockLandingPresenterCollection()
        self.view.dataSource = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
