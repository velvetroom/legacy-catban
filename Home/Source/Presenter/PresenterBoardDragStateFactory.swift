import UIKit

class PresenterBoardDragStateFactory {
    class func factoryStateWith(state:UIGestureRecognizerState) -> PresenterBoardDragState {
        return stateMap()[state]!
    }
    
    private class func stateMap() -> [UIGestureRecognizerState:PresenterBoardDragState] {
        return [
            UIGestureRecognizerState.began : PresenterBoardDragState.began,
            UIGestureRecognizerState.cancelled : PresenterBoardDragState.ended,
            UIGestureRecognizerState.ended : PresenterBoardDragState.ended,
            UIGestureRecognizerState.changed : PresenterBoardDragState.changed,
            UIGestureRecognizerState.failed : PresenterBoardDragState.ended,
            UIGestureRecognizerState.possible : PresenterBoardDragState.began]
    }
}
