import XCTest
@testable import catban

class TestCollectionUpdateInsertItems:XCTestCase {
    private var update:CollectionUpdateInsertItems!
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateInsertItems()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
    }
}
