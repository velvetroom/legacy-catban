import Foundation
@testable import Shared
@testable import Board

class MockTransitionProtocol:TransitionProtocol {
    func transitionToLoad() { }
    
    func transitionToHome(project:ProjectManagedProtocol) { }
    
    func transitionToCard(card:CardProtocol, in project:ProjectManagedProtocol) { }
}
