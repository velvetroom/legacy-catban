import XCTest
@testable import catban

class TestCollectionUpdateDeleteSections:XCTestCase {
    private var update:CollectionUpdateDeleteSections!
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateDeleteSections()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.update.indexes, "Failed to load indexes")
    }
}
