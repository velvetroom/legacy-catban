import XCTest
@testable import Home

class TestPresenterBoardDragStateFactory:XCTestCase {
    func testFactoryBegan() {
        XCTAssertEqual(self.stateWith(gestureState:UIGestureRecognizerState.began),
                       PresenterBoardDragState.began,
                       "Invalid state")
    }
    
    func testFactoryCancelled() {
        XCTAssertEqual(self.stateWith(gestureState:UIGestureRecognizerState.cancelled),
                       PresenterBoardDragState.ended,
                       "Invalid state")
    }
    
    func testFactoryEnded() {
        XCTAssertEqual(self.stateWith(gestureState:UIGestureRecognizerState.ended),
                       PresenterBoardDragState.ended,
                       "Invalid state")
    }
    
    func testFactoryChanged() {
        XCTAssertEqual(self.stateWith(gestureState:UIGestureRecognizerState.changed),
                       PresenterBoardDragState.changed,
                       "Invalid state")
    }
    
    func testFactoryFailed() {
        XCTAssertEqual(self.stateWith(gestureState:UIGestureRecognizerState.failed),
                       PresenterBoardDragState.ended,
                       "Invalid state")
    }
    
    func testFactoryPossible() {
        XCTAssertEqual(self.stateWith(gestureState:UIGestureRecognizerState.possible),
                       PresenterBoardDragState.began,
                       "Invalid state")
    }
    
    func testFactoryRecongnized() {
        XCTAssertEqual(self.stateWith(gestureState:UIGestureRecognizerState.recognized),
                       PresenterBoardDragState.ended,
                       "Invalid state")
    }
    
    private func stateWith(gestureState:UIGestureRecognizerState) -> PresenterBoardDragState {
        return PresenterBoardDragStateFactory.factoryStateWith(state:gestureState)
    }
}
