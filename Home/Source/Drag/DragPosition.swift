import UIKit

struct DragPosition {
    var initialItem:CGPoint
    var initialTouch:CGPoint
    var latestTouch:CGPoint
    
    init() {
        self.initialItem = CGPoint.zero
        self.initialTouch = CGPoint.zero
        self.latestTouch = CGPoint.zero
    }
}
