import XCTest
import Board
@testable import Canvas

class TestMapColumn_Order:XCTestCase {
    private var model:MapColumn!
    
    override func setUp() {
        super.setUp()
        self.model = MapColumn()
    }
    
    func testAddsIdentifier() {
        let identifier:String = "hello world"
        self.model.identifier = identifier
        XCTAssertEqual(self.model.order.identifier, identifier, "Not added")
    }
    
    func testAddsCards() {
        let cardAIdentifier:String = "hello world"
        let cardBIdentifier:String = "lorem ipsum"
        let cardA:MapCard = MapCard()
        cardA.identifier = cardAIdentifier
        let cardB:MapCard = MapCard()
        cardB.identifier = cardBIdentifier
        cardA.childItem = cardB
        self.model.childItem = cardA
        
        let order:OrderColumn = self.model.order
        XCTAssertEqual(order.cards.count, 2, "Invalid number of cards")
        XCTAssertEqual(order.cards[0].identifier, cardAIdentifier, "Wrong order")
        XCTAssertEqual(order.cards[1].identifier, cardBIdentifier, "Wrong order")
    }
}
