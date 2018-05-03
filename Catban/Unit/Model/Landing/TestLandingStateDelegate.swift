import XCTest
@testable import catban

class TestLandingStateDelegate:XCTestCase {
    private var model:MockLandingStateDelegateProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = MockLandingStateDelegateProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.project, "Failed to load project")
    }
}
