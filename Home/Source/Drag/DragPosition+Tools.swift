import UIKit

extension DragPosition {
    var deltaPosition:CGPoint {
        get {
            let deltaX:CGFloat = self.initial.x - self.latest.x
            let deltaY:CGFloat = self.initial.y - self.latest.y
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
            return self.deltaDistance > DragConstants.deltaForMovement
        }
    }
}
