import UIKit

class PresenterDrag {
    weak var controller:Controller!
    weak var view:ViewBoardItem?
    var strategy:PresenterDragStrategyProtocol!
    
    func beginDragging(view:ViewBoardItem, on board:ViewBoard, at position:CGPoint) {
        self.strategy = view.dragStrategy.init()
        self.strategy.view = view
        self.strategy.viewBoard = board
        self.strategy.initialPosition = position
        self.strategy.controller = self.controller
        self.strategy.beginDragging()
    }
    
    func draggedTo(position:CGPoint) {
        self.strategy.latestPosition = position
        self.strategy.moved()
    }
    
    func dragEnded() {
        self.strategy.endDragging()
        self.clearResources()
    }
    
    private func clearResources() {
        self.view = nil
        self.strategy = nil
    }
}
