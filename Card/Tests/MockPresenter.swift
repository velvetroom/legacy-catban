import Foundation
@testable import Card

class MockPresenter:Presenter {
    var onDelete:(() -> Void)?
    
    override func delete() {
        self.onDelete?()
    }
}
