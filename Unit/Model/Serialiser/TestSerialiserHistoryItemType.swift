import XCTest
@testable import catban

class TestSerialiserHistoryItemType:XCTestCase {
    private struct Constants {
        static let success:String = "CreateCard"
        static let error:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
    }
    
    func testSuccess() {
        XCTAssertNoThrow(try SerialiserHistoryItemType.factoryWith(itemType:Constants.success),
                         "Failed to factory item type")
    }
    
    func testError() {
        XCTAssertThrowsError(try SerialiserHistoryItemType.factoryWith(itemType:Constants.error),
                         "Failed to throw an error")
    }
}
