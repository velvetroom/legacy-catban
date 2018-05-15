import Foundation

class PresenterDragStrategyCardDropBack:PresenterDragStrategyCardDropProtocol {
    weak var state:PresenterDragStrategyCardStateDragging!
    
    func moved() {
        
    }
    
    func endDragging() {
        self.state.backToOriginalPositition()
    }
}
