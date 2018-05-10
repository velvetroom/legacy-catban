import Foundation
import Board

public protocol TransitionProtocol:class {
    func transitionToLoad()
    func transitionToHome(project:ProjectManagedProtocol)
    func transitionToCard(card:CardProtocol, in project:ProjectManagedProtocol)
}
