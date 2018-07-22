import Foundation

public protocol InteractorDelegateProtocol:class {
    func shouldUpdate()
    func startTransition<Transition>(completion:((Transition) -> Void))
}
