import XCTest
@testable import catban

class TestStatsViewCompletionGeneralStack:XCTestCase {
    private var view:StatsViewCompletionGeneralStack!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletionGeneralStack()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.labelNumber, "Failed to load label")
        XCTAssertNotNil(self.view.labelTitle, "Failed to load label")
        XCTAssertNotNil(self.view.viewColour, "Failed to load view")
        XCTAssertNil(self.view.layoutHeight, "Constraint should not be set by default")
    }
}
