import XCTest
@testable import catban

class TestLandingState:XCTestCase {
    private var model:LandingState!
    
    override func setUp() {
        super.setUp()
        self.model = LandingState()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNil(self.model.delegate, "Delegate should not be retained")
    }
}
