import XCTest
@testable import catban

class TestSerialiserHistoryItem:XCTestCase {
    private var model:SerialiserHistoryItem!
    private var item:HistoryItemCreateCard!
    private struct Constants {
        static let created:Int = 2345
    }
    
    override func setUp() {
        super.setUp()
        self.model = SerialiserHistoryItem()
        self.item = HistoryItemCreateCard()
        self.item.created = Constants.created
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.item, "Failed to load item")
    }
    
    func testItemType() {
        XCTAssertEqual(self.model.itemType, SerialiserHistoryItemType.unknown, "Invalid item type")
    }
    
    func testCreated() {
        let item:[String:Any] = self.model.serialise(item:self.item)
        let created:Int = item[Serialiser.Constants.History.created] as! Int
        XCTAssertEqual(created, Constants.created, "Failed to serialise created")
    }
    
    func testReturnedItemType() {
        let item:[String:Any] = self.model.serialise(item:self.item)
        let itemType:String = item[Serialiser.Constants.History.itemType] as! String
        XCTAssertEqual(itemType, SerialiserHistoryItemType.unknown.rawValue, "Failed to serialise item type")
    }
}
