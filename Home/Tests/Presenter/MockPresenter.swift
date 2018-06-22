import Foundation
@testable import Home

class MockPresenter:Presenter {
    var onShowMenu:(() -> Void)?
    var onOrientationChange:(() -> Void)?
    
    override func showMenu() {
        self.onShowMenu?()
    }
    
    override func orientationChanged() {
        self.onOrientationChange?()
    }
}
