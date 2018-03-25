import XCTest
@testable import catban

class TestLandingCollectionDelegate:XCTestCase {
    private var delegate:LandingCollectionDelegate!
    
    override func setUp() {
        super.setUp()
        self.delegate = LandingCollectionDelegate()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
}
