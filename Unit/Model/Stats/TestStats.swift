import XCTest
@testable import catban

class TestStats:XCTestCase {
    private var model:Stats!
    
    override func setUp() {
        super.setUp()
        self.model = Stats()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load stats")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
    }
}
