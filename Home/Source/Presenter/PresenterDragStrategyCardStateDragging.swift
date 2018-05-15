import UIKit

class PresenterDragStrategyCardStateDragging:PresenterDragStrategyCardStateProtocol {
    let animation:PresenterDragStrategyCardStateDraggingAnimation
    private var drop:PresenterDragStrategyCardDropProtocol
    
    weak var strategy:PresenterDragStrategyCard! {
        didSet {
            self.animation.view = self.strategy.view
        }
    }
    
    init() {
        self.animation = PresenterDragStrategyCardStateDraggingAnimation()
        self.drop = PresenterDragStrategyCardDropBack()
        self.drop.state = self
    }
    
    func moved() {
        self.animation.updateViewPositionWith(deltaPosition:self.strategy.deltaPosition)
    }
    
    func endDragging() {
        self.drop.endDragging()
    }
}
