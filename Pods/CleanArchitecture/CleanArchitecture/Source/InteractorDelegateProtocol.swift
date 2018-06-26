import Foundation

public protocol InteractorDelegateProtocol:class {
    var transition:TransitionProtocol? { get }
    
    func shouldUpdate()
}
