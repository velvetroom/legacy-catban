import XCTest
@testable import catban

class TestSerialiserHistoryItemMoveCard:XCTestCase {
    private var model:SerialiserHistoryItemMoveCard!
    private var item:HistoryItemMoveCard!
    
    private struct Constants {
        static let cardIdentifier:String = "lorem ipsum"
        static let columnIdentifier:String = "hello world"
    }
    
    override func setUp() {
        super.setUp()
        self.model = SerialiserHistoryItemMoveCard()
        self.item = HistoryItemMoveCard()
        self.item.cardIdentifier = Constants.cardIdentifier
        self.item.columnIdentifier = Constants.columnIdentifier
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.item, "Failed to load item")
    }
    
    func testItemType() {
        XCTAssertEqual(self.model.itemType, SerialiserHistoryItemType.moveCard, "Invalid item type")
    }
    
    func testCardIdentifier() {
        let item:[String:Any] = self.model.serialise(item:self.item)
        let cardIdentifier:String = item[Serialiser.Constants.History.cardIdentifier] as! String
        XCTAssertEqual(cardIdentifier, Constants.cardIdentifier, "Invalid card identifier")
    }
    
    func testColumnIdentifier() {
        let item:[String:Any] = self.model.serialise(item:self.item)
        let columnIdentifier:String = item[Serialiser.Constants.History.columnIdentifier] as! String
        XCTAssertEqual(columnIdentifier, Constants.columnIdentifier, "Invalid column identifier")
    }
}
