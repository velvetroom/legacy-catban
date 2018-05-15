import UIKit

class PresenterDragStrategyCardStateDraggingMover {
    weak var view:ViewBoardItem?
    
    func updatedRectWith(deltaPosition:CGPoint) -> CGRect {
        var rect:CGRect = CGRect.zero
        if let view:ViewBoardItem = self.view {
            rect = CGRect(
                x:view.position.x - deltaPosition.x,
                y:view.position.y - deltaPosition.y,
                width:view.layoutWidth.constant,
                height:view.layoutHeight.constant)
        }
        return rect
    }
}
