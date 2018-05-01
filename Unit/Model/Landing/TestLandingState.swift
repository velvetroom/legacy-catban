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
        XCTAssertNotNil(self.model.delegate, "Failed to load delegate")
    }
}