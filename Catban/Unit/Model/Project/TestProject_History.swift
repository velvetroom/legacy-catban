import XCTest
@testable import catban

class TestProject_History:XCTestCase {
    private var model:Project!
    
    override func setUp() {
        super.setUp()
        self.model = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testInitiallyEmpty() {
        XCTAssertTrue(self.model.history.items.isEmpty, "History should be empty")
    }
}
