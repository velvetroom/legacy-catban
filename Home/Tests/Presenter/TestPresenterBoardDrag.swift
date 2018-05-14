import XCTest
@testable import Home

class TestPresenterBoardDrag:XCTestCase {
    private var presenter:PresenterBoardDrag!
    private struct Constants {
        static let poisition:CGPoint = CGPoint(x:3, y:4)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterBoardDrag()
    }
    
    func testBegan() {
        self.presenter.updated(state:PresenterBoardDragState.began, at:Constants.poisition)
    }
    
    func testChanged() {
        self.presenter.updated(state:PresenterBoardDragState.changed, at:Constants.poisition)
    }
    
    func testEnded() {
        self.presenter.updated(state:PresenterBoardDragState.ended, at:Constants.poisition)
    }
}
