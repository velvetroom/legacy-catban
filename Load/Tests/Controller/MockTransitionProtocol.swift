import Foundation
@testable import Shared

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    
    func transitionToLoad() { }
    
    func transitionToHome() {
        self.onTransitionToHome?()
    }
}
