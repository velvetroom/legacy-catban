import Foundation

extension Landing {
    func stateStandby() {
        let state:LandingStateStandby = LandingStateStandby()
        state.delegate = self
        self.state = state
        self.reloadViewModel()
        self.editingCard = nil
    }
    
    func stateCardSelected(indexPath:IndexPath) {
        let state:LandingStateCardSelected = LandingStateCardSelected()
        state.delegate = self
        state.indexPath = indexPath
        self.state = state
        self.editingCard = indexPath
        self.reloadViewModel()
        self.scrollToEditingCard()
    }
}
