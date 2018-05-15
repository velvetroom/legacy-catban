import XCTest
@testable import Home

class TestPresenterDragStrategyCardDropPositionChange:XCTestCase {
    private var drop:PresenterDragStrategyCardDropPositionChange!
    
    override func setUp() {
        super.setUp()
        self.drop = PresenterDragStrategyCardDropPositionChange()
    }
    
    func testNotRetainingState() {
        self.drop.state = PresenterDragStrategyCardStateDragging()
        XCTAssertNil(self.drop.state, "Is retained")
    }
}
