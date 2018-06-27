import Foundation
import CleanArchitecture
import Tools

class MockDeleterInteractorProtocol:DeleterInteractorProtocol {
    var onDeleteConfirmed:(() -> Void)?
    var onDeleteCancelled:(() -> Void)?
    var presenter:InteractorDelegateProtocol?
    
    required init() { }
    
    func deleteConfirmed() {
        self.onDeleteConfirmed?()
    }
    
    func deleteCancelled() {
        self.onDeleteCancelled?()
    }
}
