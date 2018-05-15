import UIKit

class PresenterDragStrategyCardStateDragging:PresenterDragStrategyCardStateProtocol {
    let view:PresenterDragStrategyCardStateDraggingView
    
    weak var strategy:PresenterDragStrategyCard! {
        didSet {
            self.view.view = self.strategy.view
        }
    }
    
    init() {
        self.view = PresenterDragStrategyCardStateDraggingView()
    }
    
    func moved() {
        let rect:CGRect = self.view.updatedRectWith(deltaPosition:self.strategy.deltaPosition)
        self.moveView(position:rect.origin)
        self.updateBoardWith(rect:rect)
    }
    
    func endDragging() {
        self.view.animateDrop()
    }
    
    private func moveView(position:CGPoint) {
        self.view.updateView(position:position)
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
        let prospectPosition:CGPoint = board.prospectPositionFor(rect:rect)
        self.view.prospectPosition = prospectPosition
    }
}
