import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDragging:XCTestCase {
    private var state:PresenterDragStrategyCardStateDragging!
    
    override func setUp() {
        super.setUp()
        self.state = PresenterDragStrategyCardStateDragging()
    }
    
    func testNotRetainingStrategy() {
        self.state.strategy = PresenterDragStrategyCard()
        XCTAssertNil(self.state.strategy, "It is retained")
    }
}
