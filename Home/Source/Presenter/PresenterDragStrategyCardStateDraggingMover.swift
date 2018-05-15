import UIKit

class PresenterDragStrategyCardStateDraggingMover {
    weak var view:ViewBoardItem?
    
    func updatedPositionWith(deltaPosition:CGPoint) -> CGPoint {
        guard
            let view:ViewBoardItem = self.view
        else { return CGPoint.zero }
        return CGPoint(x:view.position.x - deltaPosition.x, y:view.position.y - deltaPosition.y)
    }
}
