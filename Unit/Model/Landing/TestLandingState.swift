import XCTest
@testable import catban

class TestLandingState:XCTestCase {
    private var model:MockLandingStateProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = MockLandingStateProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
