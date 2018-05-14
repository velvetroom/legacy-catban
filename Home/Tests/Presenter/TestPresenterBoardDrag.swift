import XCTest
@testable import Home

class TestPresenterBoardDrag:XCTestCase {
    private var presenter:PresenterBoardDrag!
    private struct Constants {
        static let initialPosition:CGPoint = CGPoint(x:3, y:4)
        static let updatedPosition:CGPoint = CGPoint(x:4, y:3)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterBoardDrag()
    }
    
    func testBeganDraggingCard() {
        let viewCard:ViewCard = ViewCard()
        self.presenter.beganDragging(view:viewCard, at:Constants.initialPosition)
    }
    
    func testDraggedTo() {
        self.presenter.draggedTo(position:Constants.updatedPosition)
    }
    
    func testDragEnded() {
        self.presenter.dragEnded()
    }
}
