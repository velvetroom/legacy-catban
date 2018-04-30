import XCTest
@testable import catban

class TestSerialiserHistory:XCTestCase {
    private var model:SerialiserHistory!
    private var item:HistoryItemCreateCard!
    private var serialised:[String:Any]!
    private struct Constants {
        static let created:Int = 2342
        static let items:[HistoryItemProtocol] = [
            HistoryItemCreateCard()]
        static let serialisers:[SerialiserHistoryItem.Type] = [
            SerialiserHistoryItemCreateCard.self]
    }
    
    override func setUp() {
        super.setUp()
        self.model = SerialiserHistory()
        self.item = HistoryItemCreateCard()
        self.item.created = Constants.created
        self.serialised = SerialiserHistory.serialise(item:self.item)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.item, "Failed to load item")
        XCTAssertNotNil(self.serialised, "Failed to serialise item")
    }
    
    func testSerialiseCreated() {
        let created:Int = self.serialised[Serialiser.Constants.History.created] as! Int
        XCTAssertEqual(Constants.created, created)
    }
    
    func testSerialiseItemType() {
        let itemType:String = self.serialised[Serialiser.Constants.History.itemType] as! String
        XCTAssertEqual(itemType, SerialiserHistoryItemType.createCard.rawValue, "Invalid item type")
    }
    
    func testSerialiserFor() {
        let count:Int = Constants.items.count
        for index:Int in 0 ..< count {
            let item:HistoryItemProtocol = Constants.items[index]
            let serialiserType:SerialiserHistoryItem.Type = Constants.serialisers[index]
            self.validate(item:item, for:serialiserType)
        }
    }
    
    private func validate(item:HistoryItemProtocol, for serialiserType:SerialiserHistoryItem.Type) {
        let serialiser:SerialiserHistoryItem = SerialiserHistory.serialiserFor(item:item)
        let itemType:SerialiserHistoryItem.Type = type(of:serialiser)
        XCTAssertTrue(itemType == serialiserType, "Invalid serialiser returned")
    }
}
