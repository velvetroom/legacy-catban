import XCTest
@testable import Board

class TestBoard:XCTestCase {
    private var model:Board!
    
    override func setUp() {
        super.setUp()
        self.model = Board()
    }
    
    func testLoad() {
        XCTAssertNil(self.model, "Failed to load model")
    }
}
