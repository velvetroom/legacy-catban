import Foundation
import Shared

class MockPresenterDelegateProtocol:PresenterDelegateProtocol {
    var onDidLoadPresenter:(() -> Void)?
    
    func didLoadPresenter() {
        self.onDidLoadPresenter?()
    }
}
