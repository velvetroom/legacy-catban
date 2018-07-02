import Foundation
@testable import Cloud

class MockPresenter:Presenter {
    var onDone:(() -> Void)?
    var onStart:(() -> Void)?
    
    override func done() {
        self.onDone?()
    }
    
    override func start() {
        self.onStart?()
    }
}
