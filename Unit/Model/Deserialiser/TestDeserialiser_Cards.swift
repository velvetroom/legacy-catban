import XCTest
@testable import catban

class TestDeserialiser_Cards:XCTestCase {
    private var model:Deserialiser!
    private var dataSuccess:Data!
    private var dataWrong:Data!
    private struct Constants {
        static let dataSuccess:String = "CatbanProjectSuccess"
        static let dataWrong:String = "CatbanProjectWrongCardTitle"
        static let columnIndex:Int = 1
        static let expectedCards:Int = 2
    }
    
    override func setUp() {
        super.setUp()
        self.model = Deserialiser()
        self.dataSuccess = CatbanFileLoader.loadWith(name:Constants.dataSuccess)
        self.dataWrong = CatbanFileLoader.loadWith(name:Constants.dataWrong)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.dataSuccess, "Failed to load data success")
        XCTAssertNotNil(self.dataWrong, "Failed to load data wrong")
    }
    
    func testNumberOfCards() {
        var project:ProjectProtocol!
        do {
            try project = self.model.deserialise(project:self.dataSuccess)
        } catch { }
        XCTAssertEqual(project.columns[Constants.columnIndex].cards.count, Constants.expectedCards,
                       "Invalid number of cards deserialised")
    }
    
    func testParsedTitle() {
        var project:ProjectProtocol!
        do {
            try project = self.model.deserialise(project:self.dataSuccess)
        } catch { }
        for card:ProjectCard in project.columns[Constants.columnIndex].cards {
            XCTAssertFalse(card.title.isEmpty, "Failed to parse title")
        }
    }
    
    func testParsedIdentifier() {
        var project:ProjectProtocol!
        do {
            try project = self.model.deserialise(project:self.dataSuccess)
        } catch { }
        for card:ProjectCard in project.columns[Constants.columnIndex].cards {
            XCTAssertFalse(card.identifier.isEmpty, "Failed to parse identifier")
        }
    }
    
    func testErrorWrongJson() {
        XCTAssertThrowsError(try self.model.deserialise(project:self.dataWrong), "Failed to throw an error")
    }
}
