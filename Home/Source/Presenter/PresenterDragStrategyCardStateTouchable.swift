import Foundation

class PresenterDragStrategyCardStateTouchable:PresenterDragStrategyCardStateProtocol {
    weak var strategy:PresenterDragStrategyCard!
    
    func moved() {
        if self.strategy.isMoving {
            self.strategy.draggingDetected()
        }
    }
    
    func endDragging() {
        self.strategy.touchSucceded()
    }
}
