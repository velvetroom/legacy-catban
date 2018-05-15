import Foundation

class PresenterDragStrategyCardDropBack:PresenterDragStrategyCardDropProtocol {
    weak var state:PresenterDragStrategyCardStateDragging!
    
    func endDragging() {
        self.state.animation.backToOriginalPositition()
    }
}
