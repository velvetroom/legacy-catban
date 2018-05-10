import XCTest
@testable import Board

class TestProject_Cards:XCTestCase {
    private var project:Project!
    private struct Constants {
        static let identifier:String = "lorem ipsum"
        static let notFound:String = "hello world"
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project()
        var card:CardProtocol = CardFactory.newCard()
        card.identifier = Constants.identifier
        let columnA:ColumnProtocol = ColumnFactory.newColumn()
        let columnB:ColumnProtocol = ColumnFactory.newColumn()
        columnB.add(card:card)
        self.project.add(column:columnA)
        self.project.add(column:columnB)
    }
    
    func testCardWithIndex() {
        XCTAssertNotNil(self.project.cardWith(identifier:Constants.identifier), "Not found")
    }
    
    func testCardNotFound() {
        XCTAssertNil(self.project.cardWith(identifier:Constants.notFound), "Should not exist")
    }
}
