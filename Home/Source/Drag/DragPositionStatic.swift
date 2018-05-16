import UIKit

class DragPositionStatic:DragPositionProtocol {
    weak var view:ViewBoardElement!
    
    var minX:CGFloat {
        get {
            return self.view.layoutLeft.constant
        }
        set(newValue) {
            self.view.layoutLeft.constant = newValue
        }
    }
    
    var minY:CGFloat {
        get {
            return self.view.layoutTop.constant
        }
        set(newValue) {
            self.view.layoutTop.constant = newValue
        }
    }
}
