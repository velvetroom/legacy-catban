import UIKit

class PresenterDragStrategyCardStateDraggingMover {
    weak var view:ViewBoardItem?
    var updatedPosition:CGPoint
    var deltaPosition:CGPoint {
        didSet {
            self.updatedDeltaPosition()
        }
    }
    
    init() {
        self.deltaPosition = CGPoint.zero
        self.updatedPosition = CGPoint.zero
    }
    
    private func updatedDeltaPosition() {
        guard
            let view:ViewBoardItem = self.view
        else { return }
        self.updatedPosition = CGPoint(x:view.position.x - self.deltaPosition.x,
                                     y:view.position.y - self.deltaPosition.y)
    }
}
