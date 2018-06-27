import Foundation

public protocol InteractorDelegateProtocol:class {
    func shouldUpdate()
    func shouldTransition<Transition>(completion:((Transition?) -> Void))
}
