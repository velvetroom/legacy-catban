import UIKit

class PresenterDragStrategyCardStateDragging:PresenterDragStrategyCardStateProtocol {
    let animation:PresenterDragStrategyCardStateDraggingAnimation
    let mover:PresenterDragStrategyCardStateDraggingMover
    private var drop:PresenterDragStrategyCardDropProtocol!
    
    weak var strategy:PresenterDragStrategyCard! {
        didSet {
            self.animation.view = self.strategy.view
            self.mover.view = self.strategy.view
        }
    }
    
    init() {
        self.animation = PresenterDragStrategyCardStateDraggingAnimation()
        self.mover = PresenterDragStrategyCardStateDraggingMover()
        self.dropBack()
    }
    
    func moved() {
        self.mover.deltaPosition = self.strategy.deltaPosition
        let position:CGPoint = self.mover.updatedPosition
        self.animation.updateView(position:position)
    }
    
    func endDragging() {
        self.drop.endDragging()
    }
    
    func dropBack() {
        self.drop = PresenterDragStrategyCardDropBack()
        self.drop.state = self
    }
}
