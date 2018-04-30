import XCTest
@testable import catban

class TestDeserialiserHistoryItem:XCTestCase {
    private var model:MockDeserialiserHistoryItem!
    private struct Constants {
        static let success:[String:Any] = [
            "created":23131]
        static let error:[String:Any] = [
            "createdWrong":23131]
    }
    
    override func setUp() {
        super.setUp()
        self.model = MockDeserialiserHistoryItem()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testCreatedBefore() {
        XCTAssertEqual(self.model.created, 0, "Created should not be set")
    }
    
    func testCreatedAfter() {
        let expected:Int = Constants.success["created"] as! Int
        do { let _:HistoryItemProtocol = try self.model.deserialise(item:Constants.success) } catch { }
        XCTAssertEqual(self.model.created, expected, "Failed to parse created")
    }
    
    func testSuccess() {
        XCTAssertNoThrow(try self.model.deserialise(item:Constants.success), "Failed to deserialise item")
    }
    
    func testError() {
        XCTAssertThrowsError(try self.model.deserialise(item:Constants.error), "Failed to throw an error")
    }
}
