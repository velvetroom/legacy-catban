import Foundation

extension Landing {
    func stateStandby() {
        let state:LandingStateStandby = LandingStateStandby()
        state.delegate = self
        self.state = state
    }
    
    func stateEditing(indexPath:IndexPath) {
        let state:LandingStateEditing = LandingStateEditing()
        state.delegate = self
        state.indexPath = indexPath
        self.state = state
    }
}
