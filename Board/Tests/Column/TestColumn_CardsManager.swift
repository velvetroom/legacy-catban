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
    
    func testAddCard() {
        let card:CardProtocol = CardFactory.newCard()
        self.model.add(card:card)
        XCTAssertEqual(self.model.countCards, 1, "Failed to add card")
    }
    
    func testAddCardShouldFailIfNoIdentifier() {
        let card:CardProtocol = Card()
        self.model.add(card:card)
        XCTAssertEqual(self.model.countCards, 0, "Should have not added a card")
    }
    
    func testAddCardSameIdentifier() {
        let card:CardProtocol = CardFactory.newCard()
        self.model.add(card:card)
        XCTAssertEqual(self.model.cards[0].identifier, card.identifier, "Card added doesn't have the same id")
    }
    
    func testRemoveCard() {
        let card:CardProtocol = CardFactory.newCard()
        self.model.add(card:card)
        XCTAssertEqual(self.model.countCards, 1, "Failed to add card")
        
        self.model.remove(card:card)
        XCTAssertEqual(self.model.countCards, 0, "Failed to remove card")
    }
    
    func testCardAt() {
        let cardA:CardProtocol = CardFactory.newCard()
        let cardB:CardProtocol = CardFactory.newCard()
        self.model.add(card:cardA)
        self.model.add(card:cardB)
        let retrieved:CardProtocol = self.model.cardAt(index:1)
        XCTAssertEqual(retrieved.identifier, cardB.identifier, "Retrieved card is not the right one")
    }
}
