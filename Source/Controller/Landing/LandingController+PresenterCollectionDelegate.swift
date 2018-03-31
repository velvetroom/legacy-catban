import Foundation

extension LandingController:LandingPresenterCollectionDelegateProtocol {
    func delegateSelectCellAt(index:IndexPath) {
        self.viewModelLoader.editingCard = index
        self.reloadViewModel()
    }
    
    func delegateClearSelection() {
        self.viewModelLoader.editingCard = nil
        self.reloadViewModel()
    }
}
