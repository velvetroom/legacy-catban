import XCTest
@testable import catban

class TestCollectionUpdateInsertSections:XCTestCase {
    private var update:CollectionUpdateInsertSections!
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateInsertSections()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
    }
}
