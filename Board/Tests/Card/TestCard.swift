import XCTest
@testable import Board

class TestCard:XCTestCase {
    private var model:Card!
    
    override func setUp() {
        super.setUp()
        self.model = Card()
    }
    
    func testContainerNotRetained() {
        self.model.container = Column()
        XCTAssertNil(self.model.container, "Strong retain")
    }
}
