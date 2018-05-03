import XCTest
@testable import catban

class TestLandingAdd:XCTestCase {
    private var model:LandingAdd!
    
    override func setUp() {
        super.setUp()
        self.model = LandingAdd()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
        XCTAssertNil(self.model.delegate, "Delegate should not be set")
    }
}
