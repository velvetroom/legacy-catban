import XCTest
@testable import catban

class TestProjectColumn:XCTestCase {
    private var column:ProjectColumn!
    
    override func setUp() {
        super.setUp()
        self.column = ProjectColumn()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.column, "Failed to load column")
        XCTAssertNotNil(self.column.name, "Failed to load name")
        XCTAssertNotNil(self.column.cards, "Failed to load cards")
    }
}
