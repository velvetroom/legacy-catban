import XCTest
@testable import catban

class TestLandingDelete:XCTestCase {
    private var model:LandingDelete!
    
    override func setUp() {
        super.setUp()
        self.model = LandingDelete()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
