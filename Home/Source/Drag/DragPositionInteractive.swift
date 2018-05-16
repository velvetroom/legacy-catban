import UIKit

class DragPositionInteractive:DragPositionProtocol {
    var dropableX:CGFloat
    var dropableY:CGFloat
    
    weak var view:ViewBoardElement! {
        didSet {
            self.minX = view.layoutLeft.constant
            self.minY = view.layoutTop.constant
        }
    }
    
    var minX:CGFloat {
        get {
            return self.dropableX
        }
        set(newValue) {
            self.dropableX = newValue
        }
    }
    
    var minY:CGFloat {
        get {
            return self.dropableY
        }
        set(newValue) {
            self.dropableY = newValue
        }
    }
    
    init() {
        self.dropableX = 0
        self.dropableY = 0
    }
}
