import UIKit

class PresenterDrag {
    weak var controller:Controller!
    var strategy:PresenterDragStrategyProtocol?
    
    func beginDragging(view:ViewBoardItem, on board:ViewBoard, at position:CGPoint) {
        var strategy:PresenterDragStrategyProtocol = view.dragStrategy.init()
        strategy.view = view
        strategy.viewBoard = board
        strategy.initialPosition = position
        strategy.controller = self.controller
        strategy.beginDragging()
        self.strategy = strategy
    }
    
    func draggedTo(position:CGPoint) {
        self.strategy?.latestPosition = position
        self.strategy?.moved()
    }
    
    func dragEnded() {
        self.strategy?.endDragging()
        self.clearResources()
    }
    
    private func clearResources() {
        self.strategy = nil
    }
}
