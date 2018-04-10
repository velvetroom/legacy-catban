import XCTest
@testable import catban

class TestCollectionUpdateInsertItems:XCTestCase {
    private var update:CollectionUpdateMoveItem!
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateMoveItem()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
    }
}
