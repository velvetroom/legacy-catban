import UIKit

extension PresenterDragStrategyProtocol {
    var deltaPosition:CGPoint {
        get {
            let deltaX:CGFloat = self.initialPosition.x - self.latestPosition.x
            let deltaY:CGFloat = self.initialPosition.y - self.latestPosition.y
            return CGPoint(x:deltaX, y:deltaY)
        }
    }
    
    var deltaDistance:CGFloat {
        get {
            let delta:CGPoint = self.deltaPosition
            return abs(delta.x) + abs(delta.y)
        }
    }
    
    var isMoving:Bool {
        get {
            return self.deltaDistance > PresenterConstants.Drag.minDeltaForMovement
        }
    }
}
