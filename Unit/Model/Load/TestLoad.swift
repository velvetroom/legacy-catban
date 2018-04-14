import XCTest
@testable import catban

class TestLoad:XCTestCase {
    private var model:Load!
    
    override func setUp() {
        super.setUp()
        self.model = Load()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.board, "Failed to load board")
    }
}
