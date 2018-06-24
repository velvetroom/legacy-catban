import Foundation
@testable import Column

class MockInteractor:Interactor {
    var onNamerFinished:(() -> Void)?
    var onDeleteConfirmed:(() -> Void)?
    
    override func namerFinishedWith(name: String) {
        self.onNamerFinished?()
    }
    
    override func deleteConfirmed() {
        self.onDeleteConfirmed?()
    }
}
