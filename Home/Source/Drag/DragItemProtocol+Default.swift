import UIKit

extension DragItemProtocol {
    var minX:CGFloat {
        get {
            return self.view.layoutLeft.constant
        }
    }
    
    var minY:CGFloat {
        get {
            return self.view.layoutTop.constant
        }
    }
    
    var midX:CGFloat {
        get {
            return self.view.frame.midX
        }
    }
    
    var midY:CGFloat {
        get {
            return self.view.frame.midY
        }
    }
    
    var maxX:CGFloat {
        get {
            return self.view.frame.maxX
        }
    }
    
    var maxY:CGFloat {
        get {
            return self.view.frame.maxY
        }
    }
}
