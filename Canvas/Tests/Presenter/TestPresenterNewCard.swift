import XCTest
@testable import Canvas

class TestPresenterNewCard:XCTestCase {
    private var presenter:PresenterNewCard!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterNewCard()
    }
    
    func testNotRetainingView() {
        self.presenter.view = MockView()
        XCTAssertNil(self.presenter.view, "Retaining")
    }
    
    func testNotRetainingColumn() {
        self.presenter.mapColumn = MockMapNestableColumnProtocol()
        XCTAssertNil(self.presenter.mapColumn, "Retaining")
    }
    
    func testAssignsHeight() {
        XCTAssertEqual(self.presenter.height, Constants.NewCard.height, "Invalid height")
    }
}
