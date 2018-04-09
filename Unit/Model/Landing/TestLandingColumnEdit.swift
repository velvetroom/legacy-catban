import XCTest
@testable import catban

class TestLandingColumnEdit:XCTestCase {
    private var model:LandingColumnEdit!
    
    override func setUp() {
        super.setUp()
        self.model = LandingColumnEdit()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
        XCTAssertNil(self.model.onRename, "On rename should not be set")
        XCTAssertNil(self.model.onDelete, "On delete should not be set")
    }
}
