import XCTest
@testable import catban

class TestLandingErrorController:XCTestCase {
    private var controller:LandingErrorController!
    
    override func setUp() {
        super.setUp()
        self.controller = LandingErrorController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    
}
