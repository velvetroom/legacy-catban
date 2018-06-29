import Foundation
@testable import Cloud

class MockPresenter:Presenter {
    var onDone:(() -> Void)?
    
    override func done() {
        self.onDone?()
    }
}
