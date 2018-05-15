import UIKit

class PresenterDragStrategyCard:PresenterDragStrategyProtocol {
    weak var controller:Controller!
    weak var view:ViewBoardItem?
    weak var viewBoard:ViewBoard?
    var initialPosition:CGPoint
    var latestPosition:CGPoint
    var state:PresenterDragStrategyCardStateProtocol
    
    required init() {
        self.initialPosition = CGPoint.zero
        self.latestPosition = CGPoint.zero
        self.state = PresenterDragStrategyCardStateTouchable()
        self.state.strategy = self
    }
    
    func beginDragging() {
        self.view?.dragStart()
    }
    
    func moved() {
        self.state.moved()
    }
    
    func endDragging() {
        self.view?.dragEnd()
        self.state.endDragging()
    }
    
    func draggingDetected() {
        self.state = PresenterDragStrategyCardStateDragging()
        self.state.strategy = self
    }
    
    func touchSucceded() {
        self.view?.touchSucceded(controller:self.controller)
    }
}
