import Foundation

extension LandingController:LandingPresenterCollectionDelegateProtocol {
    func delegateSelectCellAt(index:IndexPath) {
        self.model.stateCardSelected(indexPath:index)
    }
    
    func delegateClearSelection() {
        self.model.stateStandby()
    }
}
