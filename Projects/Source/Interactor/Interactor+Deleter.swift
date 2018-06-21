import Foundation
import Tools

extension Interactor:DeleterInteractorProtocol {
    public func deleteConfirmed() {
        self.state.deleterConfirmed(interactor:self)
    }
    
    public func deleteCancelled() {
        self.stateDefault()
    }
    
    func openDeleter() {
        self.state.openDeleter(interactor:self)
    }
}
