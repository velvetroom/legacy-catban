import UIKit

extension DragPosition {
    var deltaTouch:CGPoint {
        get {
            let deltaX:CGFloat = self.initialTouch.x - self.latestTouch.x
            let deltaY:CGFloat = self.initialTouch.y - self.latestTouch.y
            return CGPoint(x:deltaX, y:deltaY)
        }
    }
    
    var touchVector:CGFloat {
        get {
            let delta:CGPoint = self.deltaTouch
            return abs(delta.x) + abs(delta.y)
        }
    }
    
    var isMoving:Bool {
        get {
            return self.touchVector > Constants.Drag.deltaForMovement
        }
    }
    
    mutating func restartWith(item:MapItemProtocol, and touch:CGPoint) {
        self.initialItem = CGPoint(x:item.minX, y:item.minY)
        self.initialTouch = touch
        self.latestTouch = touch
    }
    
    func update(item:MapItemProtocol) {
        let deltaTouch:CGPoint = self.deltaTouch
        item.minX = self.initialItem.x - deltaTouch.x
        item.minY = self.initialItem.y - deltaTouch.y
    }
}
