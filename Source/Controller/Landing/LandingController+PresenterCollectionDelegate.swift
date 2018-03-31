import Foundation

extension LandingController:LandingPresenterCollectionDelegateProtocol {
    func delegateSelectCellAt(index:IndexPath) {
        self.reloadViewModelWith(editingCard:index)
    }
    
    func delegateClearSelection() {
        self.reloadViewModelWith(editingCard:nil)
    }
}
