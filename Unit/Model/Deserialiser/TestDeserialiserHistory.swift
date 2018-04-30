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
}
