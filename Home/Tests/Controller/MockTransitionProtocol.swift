import Foundation
@testable import Shared
@testable import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToCard:((CardProtocol, ProjectManagedProtocol) -> Void)?
    
    func transitionToLoad() { }
    
    func transitionToHome(project:ProjectManagedProtocol) { }
    
    func transitionToCard(card:CardProtocol, in project:ProjectManagedProtocol) {
        self.onTransitionToCard?(card, project)
    }
}
