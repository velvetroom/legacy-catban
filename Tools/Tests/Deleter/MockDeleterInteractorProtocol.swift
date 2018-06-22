import Foundation
import Shared
import Tools

class MockDeleterInteractorProtocol:DeleterInteractorProtocol {
    var onDeleteConfirmed:(() -> Void)?
    var onDeleteCancelled:(() -> Void)?
    var presenter:InteractorPresentationProtocol?
    
    required init() { }
    
    func deleteConfirmed() {
        self.onDeleteConfirmed?()
    }
    
    func deleteCancelled() {
        self.onDeleteCancelled?()
    }
}
