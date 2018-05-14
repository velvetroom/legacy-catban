import XCTest
@testable import Home

class TestViewBoard:XCTestCase {
    private var view:ViewBoard!
    private var dragDelegate:MockPresenterBoardDragProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBoard()
        self.dragDelegate = MockPresenterBoardDragProtocol()
        self.view.dragDelegate = self.dragDelegate
    }
    
    func testProperties() {
        XCTAssertTrue(self.view.columns.isEmpty, "Columns should be initially empty")
        XCTAssertTrue(self.view.items.isEmpty, "Items should be initially empty")
    }
    
    func testDragDelegateNotRetained() {
        self.view.dragDelegate = MockPresenterBoardDragProtocol()
        XCTAssertNil(self.view.dragDelegate, "Retaining")
    }
    
    func testDragEventsCallsDelegate() {
        var delegateCalled:Bool = false
        self.dragDelegate.onUpdated = { (_:PresenterBoardDragState, _:CGPoint) in
            delegateCalled = true
        }
        
        self.view.selectorPan(sender:UIPanGestureRecognizer())
        XCTAssertTrue(delegateCalled, "Not called")
    }
}
