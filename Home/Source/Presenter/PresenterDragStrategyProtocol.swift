import UIKit

protocol PresenterDragStrategyProtocol {
    var controller:Controller! { get set }
    var view:ViewBoardItem? { get set }
    var viewBoard:ViewBoard? { get set }
    var initialPosition:CGPoint! { get set }
    
    init()
    
    func beginDragging()
    func movingTo(position:CGPoint)
    func endDragging()
}
