import UIKit

struct DragPosition {
    var initial:CGPoint
    var latest:CGPoint
    
    init() {
        self.initial = CGPoint.zero
        self.latest = CGPoint.zero
    }
}
