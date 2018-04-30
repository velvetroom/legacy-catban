import XCTest
@testable import catban

class TestDeserialiserHistoryItemMoveCard:XCTestCase {
    private var model:DeserialiserHistoryItemMoveCard!
    private struct Constants {
        static let success:[String:Any] = [
            "cardIdentifier": "xfdss131",
            "columnIdentifier": "asdf2123"]
    }
    
    override func setUp() {
        super.setUp()
        self.model = DeserialiserHistoryItemMoveCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testDeserialiseSuccess() {
        XCTAssertNoThrow(try self.model.deserialiseDetailsFor(item:Constants.success), "Failed to deserialise item")
    }
    
    func testDeserialiseError() {
        XCTAssertThrowsError(try self.model.deserialiseDetailsFor(item:[:]), "Failed to throw an error")
    }
    
    func testDeserialiseCardIdentifier() {
        let expected:String = Constants.success["cardIdentifier"] as! String
        var item:HistoryItemProtocol!
        do { try item = self.model.deserialiseDetailsFor(item:Constants.success) } catch { }
        let itemCard:HistoryItemMoveCard = item as! HistoryItemMoveCard
        XCTAssertEqual(expected, itemCard.cardIdentifier, "Invalid card identifier")
    }
    
    func testDeserialiseColumnIdentifier() {
        let expected:String = Constants.success["columnIdentifier"] as! String
        var item:HistoryItemProtocol!
        do { try item = self.model.deserialiseDetailsFor(item:Constants.success) } catch { }
        let itemCard:HistoryItemMoveCard = item as! HistoryItemMoveCard
        XCTAssertEqual(expected, itemCard.columnIdentifier, "Invalid column identifier")
    }
}
