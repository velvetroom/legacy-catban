import UIKit

class PresenterDragStrategyCardStateDragging:PresenterDragStrategyCardStateProtocol {
    let animation:PresenterDragStrategyCardStateDraggingAnimation
    let mover:PresenterDragStrategyCardStateDraggingMover
    let board:PresenterDragStrategyCardStateDraggingBoard
    private var drop:PresenterDragStrategyCardDropProtocol!
    
    weak var strategy:PresenterDragStrategyCard! {
        didSet {
            self.animation.view = self.strategy.view
            self.mover.view = self.strategy.view
            self.board.view = self.strategy.viewBoard
        }
    }
    
    init() {
        self.animation = PresenterDragStrategyCardStateDraggingAnimation()
        self.mover = PresenterDragStrategyCardStateDraggingMover()
        self.board = PresenterDragStrategyCardStateDraggingBoard()
        self.dropBack()
    }
    
    func moved() {
        let position:CGPoint = self.mover.updatedPositionWith(deltaPosition:self.strategy.deltaPosition)
        self.moveView(position:position)
    }
    
    func endDragging() {
        self.drop.endDragging()
    }
    
    func dropBack() {
        self.drop = PresenterDragStrategyCardDropBack()
        self.drop.state = self
    }
    
    private func moveView(position:CGPoint) {
        self.animation.updateView(position:position)
    }
}
