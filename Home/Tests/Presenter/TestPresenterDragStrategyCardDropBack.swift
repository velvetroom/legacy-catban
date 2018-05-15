import XCTest
@testable import Home

class TestPresenterDragStrategyCardDropBack:XCTestCase {
    private var drop:PresenterDragStrategyCardDropBack!
    
    override func setUp() {
        super.setUp()
        self.drop = PresenterDragStrategyCardDropBack()
    }
    
    func testNotRetainingState() {
        self.drop.state = PresenterDragStrategyCardStateDragging()
        XCTAssertNil(self.drop.state, "Is retained")
    }
}
