import XCTest
@testable import Board

class TestProject_Cards:XCTestCase {
    private var project:Project!
    private var card:CardProtocol!
    private var columnA:ColumnProtocol!
    private struct Constants {
        static let identifier:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project()
        self.card = CardFactory.newCard()
        card.identifier = Constants.identifier
        self.columnA = ColumnFactory.newColumn()
        let columnB:ColumnProtocol = ColumnFactory.newColumn()
        columnB.add(card:card)
        self.project.add(column:self.columnA)
        self.project.add(column:columnB)
    }
    
    func testCardWithIdentifier() {
        XCTAssertNotNil(self.project.cardWith(identifier:Constants.identifier), "Not found")
    }
    
    func testRemoveCard() {
        let countCards:Int = self.project.countCards
        self.project.remove(card:self.card)
        XCTAssertLessThan(self.project.countCards, countCards, "Not removing")
    }
    
    func testAddCardWithColumns() {
        let currentCards:Int = self.columnA.countCards
        let card:CardProtocol = CardFactory.newCard()
        self.project.add(card:card)
        XCTAssertEqual(self.columnA.countCards, currentCards + 1, "Card not added to first column")
    }
    
    func testAddCardNoColumns() {
        self.project.columns = []
        let card:CardProtocol = CardFactory.newCard()
        self.project.add(card:card)
        XCTAssertEqual(self.project.countCards, 0, "Error adding card")
    }
}
