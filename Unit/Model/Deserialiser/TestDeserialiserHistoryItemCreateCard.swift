import XCTest
@testable import catban

class TestDeserialiserHistoryItemCreateCard:XCTestCase {
    private var model:DeserialiserHistoryItemCreateCard!
    private struct Constants {
        static let success:[String:Any] = [
            "cardIdentifier": "xfdss131"]
    }
    
    override func setUp() {
        super.setUp()
        self.model = DeserialiserHistoryItemCreateCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testDeserialiseSuccess() {
        XCTAssertNoThrow(try self.model.deserialiseDetailsFor(item:Constants.success),
                         "Failed to deserialise item")
    }
    
    func testDeserialiseError() {
        XCTAssertThrowsError(try self.model.deserialiseDetailsFor(item:[:]),
                         "Failed to throw an error")
    }
    
    func testDeserialiseCardIdentifier() {
        let expected:String = Constants.success["cardIdentifier"] as! String
        var item:HistoryItemProtocol!
        do { try item = self.model.deserialiseDetailsFor(item:Constants.success) } catch { }
        let itemCard:HistoryItemCreateCard = item as! HistoryItemCreateCard
        XCTAssertEqual(expected, itemCard.cardIdentifier, "Invalid card identifier")
    }
}
