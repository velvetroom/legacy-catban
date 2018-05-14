import UIKit
@testable import Home

class MockPresenterDragStrategyProtocol:PresenterDragStrategyProtocol {
    static var beganDragging:Bool = false
    var controller:Controller!
    var view:ViewBoardItem?
    var viewBoard:ViewBoard?
    var initialPosition:CGPoint!
    
    required init() { }
    
    func beginDragging() {
        MockPresenterDragStrategyProtocol.beganDragging = true
    }
    
    func movingTo(position:CGPoint) { }
    func endDragging() { }
}
