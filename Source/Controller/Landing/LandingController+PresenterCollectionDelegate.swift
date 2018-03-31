import Foundation

extension LandingController:LandingPresenterCollectionDelegateProtocol {
    func delegateSelectCellAt(index:IndexPath) {
        self.model.update(editingCard:index)
    }
    
    func delegateClearSelection() {
        self.model.update(editingCard:nil)
    }
}
