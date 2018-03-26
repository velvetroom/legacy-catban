import XCTest
@testable import catban

class TestLandingViewCollection:XCTestCase {
    private var view:LandingViewCollection!
    private var delegate:MockLandingCollectionDelegate!
    
    override func setUp() {
        super.setUp()
        self.view = LandingViewCollection()
        self.delegate = MockLandingCollectionDelegate()
        self.view.dataSource = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
