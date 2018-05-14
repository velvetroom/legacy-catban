import UIKit

class PresenterDragStrategyCard:PresenterDragStrategyProtocol {
    weak var controller:Controller!
    weak var view:ViewBoardItem?
    weak var viewBoard:ViewBoard?
    var initialPosition:CGPoint!
    
    required init() { }
    
    func beginDragging() { }
    func movingTo(position:CGPoint) { }
    func endDragging() { }
}
