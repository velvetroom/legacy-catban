import UIKit
@testable import Home

class MockViewBoardItem:ViewBoardItem {
    var onDragStart:(() -> Void)?
    var onDragDelta:((CGPoint) -> Void)?
    var onDragEnd:(() -> Void)?
    var onTouchSucceded:((Controller) -> Void)?
    
    override init() {
        super.init()
        self.dragStrategy = MockPresenterDragStrategyProtocol.self
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func dragStart() {
        self.onDragStart?()
    }
    
    override func drag(delta:CGPoint) {
        self.onDragDelta?(delta)
    }
    
    override func dragEnd() {
        self.onDragEnd?()
    }
    
    override func touchSucceded(controller:Controller) {
        self.onTouchSucceded?(controller)
    }
}
