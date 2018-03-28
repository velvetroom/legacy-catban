import XCTest
@testable import catban

class TestLandingPresenterCollectionDataSource_Moving:XCTestCase {
    private var presenter:LandingPresenterCollectionDataSource!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionDataSource()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
