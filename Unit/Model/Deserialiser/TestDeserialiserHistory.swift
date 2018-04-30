import XCTest
@testable import catban

class TestDeserialiserHistory:XCTestCase {
    private var model:DeserialiserHistory!
    private struct Constants {
        static let empty:[String:Any] = [:]
        static let malformed:[String:Any] = ["typeWrong":"CreateCard"]
        static let incomplete:[String:Any] = [
            "type": "CreateCard",
            "card": "sda2"]
        static let success:[String:Any] = [
            "type": "CreateCard",
            "created": 1000,
            "card": "sda2"]
        static let identifiersMap:[String:DeserialiserHistoryItem.Type] = [
            "CreateCard" : DeserialiserHistoryItemCreateCard.self]
    }
    
    override func setUp() {
        super.setUp()
        self.model = DeserialiserHistory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testDeserialiseShouldThrowOnEmpty() {
        XCTAssertThrowsError(try DeserialiserHistory.deserialise(item:Constants.empty),
                             "Failed to throw an error")
    }
    
    func testDeserialiseShouldThrowOnMalformed() {
        XCTAssertThrowsError(try DeserialiserHistory.deserialise(item:Constants.malformed),
                             "Failed to throw an error")
    }
    
    func testDeserialiseShouldThrowOnIncomplete() {
        XCTAssertThrowsError(try DeserialiserHistory.deserialise(item:Constants.incomplete),
                             "Failed to throw an error")
    }
    
    func testDeserialiseNoThrows() {
        XCTAssertNoThrow(try DeserialiserHistory.deserialise(item:Constants.success),
                             "Failed to deserialise item")
    }
    
    func testDeserialiserForIdentifiers() {
        let keys:[String] = Array(Constants.identifiersMap.keys)
        for key:String in keys {
            let itemType:DeserialiserHistoryItem.Type = Constants.identifiersMap[key]!
            self.validate(identifier:key, with:itemType)
        }
    }
    
    func testDeserialiserForUnknown() {
        XCTAssertThrowsError(try DeserialiserHistory.deserialiserFor(identifier:String()),
                             "Failed to throw an error")
    }
    
    private func validate(identifier:String, with itemType:DeserialiserHistoryItem.Type) {
        var item:DeserialiserHistoryItem.Type!
        XCTAssertNoThrow(try item = DeserialiserHistory.deserialiserFor(identifier:identifier))
        XCTAssertTrue(itemType == item, "Invalid deserialiser received")
    }
}
