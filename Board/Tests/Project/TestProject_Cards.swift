import XCTest
@testable import Board

class TestProject_Cards:XCTestCase {
    private var project:Project!
    private var card:CardProtocol!
    private struct Constants {
        static let identifier:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project()
        self.card = CardFactory.newCard()
        card.identifier = Constants.identifier
        let columnA:ColumnProtocol = ColumnFactory.newColumn()
        let columnB:ColumnProtocol = ColumnFactory.newColumn()
        columnB.add(card:card)
        self.project.add(column:columnA)
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
}
