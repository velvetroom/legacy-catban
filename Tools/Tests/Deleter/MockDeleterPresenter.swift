import Foundation
@testable import Tools

class MockDeleterPresenter:DeleterPresenter<MockDeleterInteractorProtocol> {
    var onCancel:(() -> Void)?
    var onConfirm:(() -> Void)?
    
    override func cancel() {
        self.onCancel?()
    }
    
    override func confirm() {
        self.onConfirm?()
    }
}
