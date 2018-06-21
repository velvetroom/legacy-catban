import Foundation

public protocol InteractorPresentationProtocol:class {
    var transition:TransitionProtocol? { get }
    
    func shouldUpdate()
}
