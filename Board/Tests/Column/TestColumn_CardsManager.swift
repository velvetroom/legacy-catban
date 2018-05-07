import XCTest
@testable import Board

class TestColumn_CardsManager:XCTestCase {
    private var model:Column!
    
    override func setUp() {
        super.setUp()
        self.model = Column()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testCountCards() {
        XCTAssertEqual(self.model.countCards, 0, "Should have no cards")
    }
    
    func testCountCardsAfterAppending() {
        self.model.cards.append(Card())
        XCTAssertEqual(self.model.countCards, 1, "Should have 1 card")
    }
}
