import UIKit

extension DragPosition {
    var isMoving:Bool {
        get {
            return self.touchVector > Constants.Drag.deltaForMovement
        }
    }
    
    var updatedPosition:CGPoint {
        get {
            let deltaTouch:CGPoint = self.deltaTouch
            let updatedX:CGFloat = self.initialItem.x - deltaTouch.x
            let updatedY:CGFloat = self.initialItem.y - deltaTouch.y
            return CGPoint(x:updatedX, y:updatedY)
        }
    }
    
    private var deltaTouch:CGPoint {
        get {
            let deltaX:CGFloat = self.initialTouch.x - self.latestTouch.x
            let deltaY:CGFloat = self.initialTouch.y - self.latestTouch.y
            return CGPoint(x:deltaX, y:deltaY)
        }
    }
    
    private var touchVector:CGFloat {
        get {
            let delta:CGPoint = self.deltaTouch
            return abs(delta.x) + abs(delta.y)
        }
    }
}
