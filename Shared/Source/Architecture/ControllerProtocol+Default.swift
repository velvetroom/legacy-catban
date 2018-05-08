import Foundation

public extension ControllerProtocol {
    public func didLoadPresenter() {
        self.presenter.shouldUpdate()
    }
}
