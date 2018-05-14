import XCTest
@testable import Home

class TestPresenterDragStrategyCard:XCTestCase {
    private var strategy:PresenterDragStrategyCard!
    
    override func setUp() {
        super.setUp()
        self.strategy = PresenterDragStrategyCard()
    }
    
    func testNotRetainsController() {
        self.strategy.controller = Controller()
        XCTAssertNil(self.strategy.controller, "Retains")
    }
    
    func testNotRetainsView() {
        self.strategy.view = ViewCard()
        XCTAssertNil(self.strategy.view, "Retains")
    }
    
    func testNotRetainsBoard() {
        self.strategy.viewBoard = ViewBoard()
        XCTAssertNil(self.strategy.viewBoard, "Retains")
    }
}
