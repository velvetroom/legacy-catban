import XCTest
@testable import Home

class TestPresenterDragStrategyFixed:XCTestCase {
    private var strategy:PresenterDragStrategyFixed!
    
    override func setUp() {
        super.setUp()
        self.strategy = PresenterDragStrategyFixed()
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
