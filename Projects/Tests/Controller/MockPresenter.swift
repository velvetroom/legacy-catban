import Foundation
@testable import Projects

class MockPresenter:Presenter {
    var onShouldUpdate:(() -> Void)?
    
    override func shouldUpdate() {
        self.onShouldUpdate?()
    }
}
