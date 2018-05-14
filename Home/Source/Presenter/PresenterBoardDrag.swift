import UIKit

class PresenterBoardDrag:PresenterBoardDragProtocol {
    private var router:[PresenterBoardDragState : ((CGPoint) -> Void)] {
        get {
            return [
                PresenterBoardDragState.began : self.stateBegan,
                PresenterBoardDragState.changed : self.stateChanged,
                PresenterBoardDragState.ended : self.stateEnded]
        }
    }
    
    func updated(state:PresenterBoardDragState, at position:CGPoint) {
        self.router[state]!(position)
    }
    
    private func stateBegan(position:CGPoint) {
        
    }
    
    private func stateChanged(position:CGPoint) {
        
    }
    
    private func stateEnded(position:CGPoint) {
        
    }
}
