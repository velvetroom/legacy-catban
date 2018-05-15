import UIKit
@testable import Home

class MockPresenterDragStrategyProtocol:PresenterDragStrategyProtocol {
    static var beganDragging:Bool = false
    var onMoved:(() -> Void)?
    var onEndDragging:(() -> Void)?
    var controller:Controller!
    var view:ViewBoardItem?
    var viewBoard:ViewBoard?
    var initialPosition:CGPoint
    var latestPosition:CGPoint
    
    required init() {
        self.initialPosition = CGPoint.zero
        self.latestPosition = CGPoint.zero
    }
    
    func beginDragging() {
        MockPresenterDragStrategyProtocol.beganDragging = true
    }
    
    func moved() {
        self.onMoved?()
    }
    
    func endDragging() {
        self.onEndDragging?()
    }
}
