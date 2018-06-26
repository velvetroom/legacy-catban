import Foundation

public protocol TransitionProtocol:class {
    func transitionTo(view:ViewProtocol)
    func present(view:ViewProtocol)
    func pushTo(view:ViewProtocol)
    func pop()
    func dismiss()
}
