import Foundation
import Board

public protocol TransitionProtocol {
    func transitionToLoad()
    func transitionToHome(project:ProjectManagedProtocol)
    func transitionToCard(card:CardProtocol, in project:ProjectManagedProtocol)
}
