import Foundation
@testable import Shared

class MockControllerProtocol:ControllerProtocol {
    var onDidLoadPresenter:(() -> Void)?
    var transiton:TransitionProtocol!
    var presenter:PresenterProtocol
    
    required init() {
        self.presenter = MockPresenterProtocol()
    }
    
    func didLoadPresenter() {
        self.onDidLoadPresenter?()
    }
}
