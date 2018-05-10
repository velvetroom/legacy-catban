import Foundation
@testable import Shared
@testable import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:((ProjectManagedProtocol) -> Void)?
    
    func transitionToLoad() { }
    
    func transitionToCard(card:CardProtocol, in project:ProjectManagedProtocol) { }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?(project)
    }
}
