import UIKit

class PresenterDrag {
    weak var controller:Controller!
    weak var view:ViewBoardItem?
    var strategy:PresenterDragStrategyProtocol!
    
    func beganDragging(view:ViewBoardItem, on board:ViewBoard, at position:CGPoint) {
        self.strategy = view.dragStrategy.init()
        self.strategy.view = view
        self.strategy.viewBoard = board
        self.strategy.initialPosition = position
        self.strategy.controller = self.controller
        self.strategy.beginDragging()
    }
    
    func draggedTo(position:CGPoint) {
        
    }
    
    func dragEnded() {
        view?.dragEnd()
    }
}
