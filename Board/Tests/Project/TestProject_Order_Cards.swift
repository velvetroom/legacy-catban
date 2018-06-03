import XCTest
@testable import Board

class TestProject_Order_Cards:XCTestCase {
    private var model:Project!
    private var order:Order!
    private var columnA:Column!
    private var columnB:Column!
    private var orderColumnA:OrderColumn!
    private var orderColumnB:OrderColumn!
    private var cardA:CardProtocol!
    private var cardB:CardProtocol!
    private var cardC:CardProtocol!
    private var orderCardA:OrderCard!
    private var orderCardB:OrderCard!
    private var orderCardC:OrderCard!
    
    override func setUp() {
        super.setUp()
        self.model = Project()
        self.order = Order()
        self.columnA = ColumnFactory.newColumn() as! Column
        self.columnB = ColumnFactory.newColumn() as! Column
        self.orderColumnA = OrderColumn()
        self.orderColumnB = OrderColumn()
        self.orderColumnA.identifier = self.columnA.identifier
        self.orderColumnB.identifier = self.columnB.identifier
        self.cardA = CardFactory.newCard()
        self.cardB = CardFactory.newCard()
        self.cardC = CardFactory.newCard()
        self.orderCardA = OrderCard()
        self.orderCardB = OrderCard()
        self.orderCardC = OrderCard()
        self.orderCardA.identifier = self.cardA.identifier
        self.orderCardB.identifier = self.cardB.identifier
        self.orderCardC.identifier = self.cardC.identifier
        self.columnA.cards = [self.cardA, self.cardB]
        self.columnB.cards = [self.cardC]
        self.model.columns = [self.columnA, self.columnB]
    }
    
    func testReorderingCardsNoChange() {
        self.orderColumnA.cards = [self.orderCardA, self.orderCardB]
        self.orderColumnB.cards = [self.orderCardC]
        self.reOrder()
        
        XCTAssertEqual(self.columnA.cards[0].identifier, self.cardA.identifier, "Wrong order")
        XCTAssertEqual(self.columnA.cards[1].identifier, self.cardB.identifier, "Wrong order")
        XCTAssertEqual(self.columnB.cards[0].identifier, self.cardC.identifier, "Wrong order")
    }
    
    func testReorderingCardsMoveFirstAtBeginning() {
        self.orderColumnA.cards = [self.orderCardB]
        self.orderColumnB.cards = [self.orderCardA, self.orderCardC]
        self.reOrder()
        
        XCTAssertEqual(self.columnA.cards[0].identifier, self.cardB.identifier, "Wrong order")
        XCTAssertEqual(self.columnB.cards[0].identifier, self.cardA.identifier, "Wrong order")
        XCTAssertEqual(self.columnB.cards[1].identifier, self.cardC.identifier, "Wrong order")
    }
    
    func testReorderingCardsMoveFirstToEnd() {
        self.orderColumnA.cards = [self.orderCardB]
        self.orderColumnB.cards = [self.orderCardC, self.orderCardA]
        self.reOrder()
        
        XCTAssertEqual(self.columnA.cards[0].identifier, self.cardB.identifier, "Wrong order")
        XCTAssertEqual(self.columnB.cards[0].identifier, self.cardC.identifier, "Wrong order")
        XCTAssertEqual(self.columnB.cards[1].identifier, self.cardA.identifier, "Wrong order")
    }
    
    func testReorderingCardsMoveAllToSecond() {
        self.orderColumnB.cards = [self.orderCardA, self.orderCardC, self.orderCardB]
        self.reOrder()
        
        XCTAssertEqual(self.columnB.cards[0].identifier, self.cardA.identifier, "Wrong order")
        XCTAssertEqual(self.columnB.cards[1].identifier, self.cardC.identifier, "Wrong order")
        XCTAssertEqual(self.columnB.cards[2].identifier, self.cardB.identifier, "Wrong order")
    }
    
    func testReorderingCardsMoveAllToFirst() {
        self.orderColumnA.cards = [self.orderCardC, self.orderCardB, self.orderCardA]
        self.reOrder()
        
        XCTAssertEqual(self.columnA.cards[0].identifier, self.cardC.identifier, "Wrong order")
        XCTAssertEqual(self.columnA.cards[1].identifier, self.cardB.identifier, "Wrong order")
        XCTAssertEqual(self.columnA.cards[2].identifier, self.cardA.identifier, "Wrong order")
    }
    
    func testReorderingCardsReorder() {
        self.orderColumnA.cards = [self.orderCardB, self.orderCardA]
        self.orderColumnB.cards = [self.orderCardC]
        self.reOrder()
        
        XCTAssertEqual(self.columnA.cards[0].identifier, self.cardB.identifier, "Wrong order")
        XCTAssertEqual(self.columnA.cards[1].identifier, self.cardA.identifier, "Wrong order")
        XCTAssertEqual(self.columnB.cards[0].identifier, self.cardC.identifier, "Wrong order")
    }
    
    func testReorderingCardsContainer() {
        self.orderColumnB.cards = [self.orderCardA, self.orderCardB, self.orderCardC]
        self.reOrder()
        
        let containerA:Column? = self.cardA.container as? Column
        let containerB:Column? = self.cardB.container as? Column
        let containerC:Column? = self.cardC.container as? Column
        XCTAssertEqual(containerA, self.columnB, "Wrong order")
        XCTAssertEqual(containerB, self.columnB, "Wrong order")
        XCTAssertEqual(containerC, self.columnB, "Wrong order")
    }
    
    private func reOrder() {
        self.order.columns = [self.orderColumnA, self.orderColumnB]
        self.model.orderWith(order:self.order)
    }
}
