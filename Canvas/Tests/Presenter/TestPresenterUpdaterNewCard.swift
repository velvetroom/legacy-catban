import XCTest
@testable import Home

class TestPresenterUpdaterNewCard:XCTestCase {
    private var presenter:PresenterUpdaterNewCard!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterUpdaterNewCard()
    }
    
    func testNotRetainingBoard() {
        self.presenter.viewBoard = ViewBoard()
        XCTAssertNil(self.presenter.viewBoard, "Retaining")
    }
    
    func testNotRetainingColumn() {
        self.presenter.column = MapColumn()
        XCTAssertNil(self.presenter.column, "Retaining")
    }
}
