import XCTest
@testable import Board

class TestColumn:XCTestCase {
    private var model:Column!
    
    override func setUp() {
        super.setUp()
        self.model = Column()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.countCards, "Failed to load count")
        XCTAssertNotNil(self.model.cards, "Failed to load cards")
        XCTAssertNotNil(self.model.name, "Failed to load name")
    }
}
