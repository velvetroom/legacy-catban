import Foundation
@testable import Column

class MockPresenter:Presenter {
    var onDelete:(() -> Void)?
    var onDone:(() -> Void)?
    
    override func delete() {
        self.onDelete?()
    }
    
    override func done() {
        self.onDone?()
    }
}
