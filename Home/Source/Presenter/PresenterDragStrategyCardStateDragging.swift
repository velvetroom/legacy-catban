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
        let rect:CGRect = self.mover.updatedRectWith(deltaPosition:self.strategy.deltaPosition)
        self.moveView(position:rect.origin)
        self.updateBoardWith(rect:rect)
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
    
    private func updateBoardWith(rect:CGRect) {
        guard
            let view:ViewBoardItem = self.strategy.view,
            let viewBoard:ViewBoard = self.strategy.viewBoard
        else { return }
        let board:PresenterDragStrategyCardStateDraggingBoard = PresenterDragStrategyCardStateDraggingBoard()
        board.view = view
        board.viewBoard = viewBoard
        self.updateBoardWith(rect:rect, and:board)
    }
    
    private func updateBoardWith(rect:CGRect, and board:PresenterDragStrategyCardStateDraggingBoard) {
        guard
            let column:ViewColumn = board.columnAtPosition(rect:rect)
        else { return }
    }
}
