import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory:XCTestCase {
    private var factory:LandingCollectionUpdateFactory!
    
    override func setUp() {
        super.setUp()
        self.factory = LandingCollectionUpdateFactory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
    }
}
