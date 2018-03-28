import XCTest
@testable import catban

class TestLandingController_DataSourceProtocol:XCTestCase {
    private var controller:LandingController!
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}
