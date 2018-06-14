import Foundation
import Board

extension Interactor {
    func stateSelecting(index:Int, identifier:String) {
        let state:StateSelecting = StateSelecting()
        state.index = index
        state.project = self.board.projectWith(identifier:identifier)
        self.state = state
    }
}
