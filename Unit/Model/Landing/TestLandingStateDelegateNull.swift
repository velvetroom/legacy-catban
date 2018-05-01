import XCTest
@testable import catban

class TestLandingStateDelegateNull:XCTestCase {
    private var model:LandingStateDelegateNull!
    
    override func setUp() {
        super.setUp()
        self.model = LandingStateDelegateNull()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
