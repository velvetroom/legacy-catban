import Foundation
import Board

public protocol TransitionProtocol {
    func transitionToLoad()
    func transitionToHome(project:ProjectManagedProtocol)
}
