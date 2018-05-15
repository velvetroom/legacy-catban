import XCTest
@testable import Home

class TestPresenterDragStrategyCardDropColumnChange:XCTestCase {
    private var drop:PresenterDragStrategyCardDropColumnChange!
    
    override func setUp() {
        super.setUp()
        self.drop = PresenterDragStrategyCardDropColumnChange()
    }
    
    func testNotRetainingState() {
        self.drop.state = PresenterDragStrategyCardStateDragging()
        XCTAssertNil(self.drop.state, "Is retained")
    }
}
