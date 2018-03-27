import XCTest
@testable import catban

class TestLandingViewCollection:XCTestCase {
    private var view:LandingViewCollection!
    private var delegate:MockLandingPresenterCollectionDataSource!
    
    override func setUp() {
        super.setUp()
        self.view = LandingViewCollection()
        self.delegate = MockLandingPresenterCollectionDataSource()
        self.view.dataSource = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
