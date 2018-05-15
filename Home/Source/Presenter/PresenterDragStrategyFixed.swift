import UIKit

class PresenterDragStrategyFixed:PresenterDragStrategyProtocol {
    weak var controller:Controller!
    weak var view:ViewBoardItem?
    weak var viewBoard:ViewBoard?
    var initialPosition:CGPoint
    var latestPosition:CGPoint
    
    required init() {
        self.initialPosition = CGPoint.zero
        self.latestPosition = CGPoint.zero
    }
    
    func beginDragging() {
        self.view?.dragStart()
    }
    
    func moved() { }
    
    func endDragging() {
        self.view?.dragEnd()
    }
}
