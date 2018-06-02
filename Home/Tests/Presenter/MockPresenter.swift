import Foundation
@testable import Home

class MockPresenter:Presenter {
    var onShowMenu:(() -> Void)?
    
    override func showMenu() {
        self.onShowMenu?()
    }
}
