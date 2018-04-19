import XCTest
@testable import catban

class TestSerialiser_Card:XCTestCase {
    private var model:Serialiser!
    private var column:ProjectColumn!
    private struct Constants {
        static let title:String = "hello world"
        static let identifier:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Serialiser()
        self.column = ProjectColumn()
        let card:ProjectCard = ProjectCard()
        card.identifier = Constants.identifier
        card.title = Constants.title
        self.column.cards.append(card)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.column, "Failed to load column")
    }
    
    func testSameAmountOfCards() {
        let array:[Any] = self.model.cardArrayWith(column:self.column)
        XCTAssertEqual(array.count, self.column.cards.count, "Failed to serialise cards")
    }
    
    func testAsDictionary() {
        let array:[Any] = self.model.cardArrayWith(column:self.column)
        let dictionary:[String:Any]! = array.first as? [String:Any]
        XCTAssertNotNil(dictionary, "Invalid object received")
    }
    
    func testIdentifier() {
        let array:[Any] = self.model.cardArrayWith(column:self.column)
        let dictionary:[String:Any]! = array.first as? [String:Any]
        let identifier:String! = dictionary[Serialiser.Constants.Card.identifier] as? String
        XCTAssertEqual(identifier, Constants.identifier, "Invalid identifier serialised")
    }
    
    func testTitle() {
        let array:[Any] = self.model.cardArrayWith(column:self.column)
        let dictionary:[String:Any]! = array.first as? [String:Any]
        let title:String! = dictionary[Serialiser.Constants.Card.title] as? String
        XCTAssertEqual(title, Constants.title, "Invalid title serialised")
    }
}
