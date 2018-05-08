import Foundation
@testable import Shared
@testable import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:((ProjectManagedProtocol) -> Void)?
    
    func transitionToLoad() { }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?(project)
    }
}
