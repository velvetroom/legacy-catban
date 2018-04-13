import XCTest
@testable import catban

class TestLandingError:XCTestCase {
    private var model:LandingError!
    
    override func setUp() {
        super.setUp()
        self.model = LandingError()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.message, "Failed to load message")
    }
}
