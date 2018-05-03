import XCTest
@testable import catban

class TestSerialiserHistoryItemCreateCard:XCTestCase {
    private var model:SerialiserHistoryItemCreateCard!
    private var item:HistoryItemCreateCard!
    
    private struct Constants {
        static let cardIdentifier:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.model = SerialiserHistoryItemCreateCard()
        self.item = HistoryItemCreateCard()
        self.item.cardIdentifier = Constants.cardIdentifier
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.item, "Failed to load item")
    }
    
    func testItemType() {
        XCTAssertEqual(self.model.itemType, SerialiserHistoryItemType.createCard, "Invalid item type")
    }
    
    func testCardIdentifier() {
        let item:[String:Any] = self.model.serialise(item:self.item)
        let cardIdentifier:String = item[Serialiser.Constants.History.cardIdentifier] as! String
        XCTAssertEqual(cardIdentifier, Constants.cardIdentifier, "Invalid card identifier")
    }
}
