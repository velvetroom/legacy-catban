import XCTest
@testable import Board

class TestColumn_Cards:XCTestCase {
    private var column:Column!
    private struct Constants {
        static let identifier:String = "lorem ipsum"
        static let notFound:String = "hello world"
    }
    
    override func setUp() {
        super.setUp()
        self.column = Column()
        let cardA:CardProtocol = CardFactory.newCard()
        var cardB:CardProtocol = CardFactory.newCard()
        cardB.identifier = Constants.identifier
        self.column.add(card:cardA)
        self.column.add(card:cardB)
    }
    
    func testCardWithIndex() {
        XCTAssertNotNil(self.column.cardWith(identifier:Constants.identifier), "Not found")
    }
    
    func testCardNotFound() {
        XCTAssertNil(self.column.cardWith(identifier:Constants.notFound), "Should not exist")
    }
}
