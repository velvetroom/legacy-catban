import Foundation
import Board

extension Interactor {
    func stateDefault() {
        self.state = StateDefault()
    }
    
    func stateRenameProjectWith(identifier:String) {
        let project:ProjectProtocol = self.board.projectWith(identifier:identifier)
        let state:StateRename = StateRename()
        state.project = project
        self.state = state
    }
}
