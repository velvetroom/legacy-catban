import Foundation

extension Interactor {
    func stateSelecting(index:Int) {
        let state:StateSelecting = StateSelecting()
        state.index = index
        self.state = state
    }
}
