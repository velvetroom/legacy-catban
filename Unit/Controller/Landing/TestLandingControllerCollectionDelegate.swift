import XCTest
@testable import catban

class TestLandingControllerCollectionDelegate:XCTestCase {
    private var delegate:LandingControllerCollectionDelegate!
    
    override func setUp() {
        super.setUp()
        self.delegate = LandingControllerCollectionDelegate()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
}
