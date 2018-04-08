import XCTest
@testable import catban

class TestLandingDelete:XCTestCase {
    private var model:LandingDelete!
    
    override func setUp() {
        super.setUp()
        self.model = LandingDelete()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.model.itemName, "Failed to load item name")
        XCTAssertNil(self.model.onConfirm, "On confirm should not be set")
    }
}
