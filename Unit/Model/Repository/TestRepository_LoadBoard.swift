import XCTest
@testable import catban

class TestRepository_LoadBoard:XCTestCase {
    private var model:Load!
    
    override func setUp() {
        super.setUp()
        self.model = Load()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
