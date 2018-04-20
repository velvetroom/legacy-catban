import XCTest
@testable import catban

class TestOrganiseController:XCTestCase {
    private var controller:OrganiseController!
    
    override func setUp() {
        super.setUp()
        self.controller = OrganiseController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}
