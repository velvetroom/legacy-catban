import XCTest
@testable import Board

class TestCard:XCTestCase {
    private var model:Card!
    
    override func setUp() {
        super.setUp()
        self.model = Card()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
