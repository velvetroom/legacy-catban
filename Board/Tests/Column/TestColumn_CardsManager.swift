import XCTest
@testable import Board

class TestColumn_CardsManager:XCTestCase {
    private var model:Column!
    
    override func setUp() {
        super.setUp()
        self.model = Column()
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
    
    func testIterate() {
        let cardA:CardProtocol = CardFactory.newCard()
        let cardB:CardProtocol = CardFactory.newCard()
        self.model.add(card:cardA)
        self.model.add(card:cardB)
        var foundA:Bool = false
        var foundB:Bool = false
        
        self.model.iterate { (card:CardProtocol) in
            if card.identifier == cardA.identifier {
                foundA = true
            } else if card.identifier == cardB.identifier {
                foundB = true
            }
        }
        
        XCTAssertTrue(foundA, "Failed to iterate card A")
        XCTAssertTrue(foundB, "Failed to iterate card B")
    }
    
    func testAddCardSetsContainer() {
        let card:CardProtocol = CardFactory.newCard()
        self.model.add(card:card)
        XCTAssertNotNil(card.container, "Not assigned")
    }
}
