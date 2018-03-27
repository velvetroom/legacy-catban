import UIKit

class MockLandingPresentercollectionGesture:UILongPressGestureRecognizer {
    var fakeState:UIGestureRecognizerState
    
    init() {
        self.fakeState = UIGestureRecognizerState.ended
        super.init(target:nil, action:nil)
    }
    
    override var state:UIGestureRecognizerState {
        get {
            return self.fakeState
        }
    }
}
