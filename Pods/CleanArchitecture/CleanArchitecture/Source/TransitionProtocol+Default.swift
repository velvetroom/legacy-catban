import Foundation

public extension TransitionProtocol {
    func transitionTo(view:ViewProtocol) { }
    func present(view:ViewProtocol) { }
    func pushTo(view:ViewProtocol) { }
    func pop() { }
    func dismiss() { }
}
