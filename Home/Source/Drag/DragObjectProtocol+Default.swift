import UIKit

extension DragObjectProtocol {
    var view:ViewBoardElement! {
        get {
            return self.position.view
        }
        set(newValue) {
            self.position.view = newValue
        }
    }
    
    var minX:CGFloat {
        get {
            return self.position.minX
        }
        set(newValue) {
            self.position.minX = newValue
            self.updatedPosition()
        }
    }
    
    var minY:CGFloat {
        get {
            return self.position.minY
        }
        set(newValue) {
            self.position.minY = newValue
            self.updatedPosition()
        }
    }
    
    var midX:CGFloat {
        get {
            return self.minX + self.width_2
        }
    }
    
    var midY:CGFloat {
        get {
            return self.minY + self.height_2
        }
    }
    
    var maxX:CGFloat {
        get {
            return self.minX + self.view.layoutWidth.constant
        }
    }
    
    var maxY:CGFloat {
        get {
            return self.minY + self.view.layoutHeight.constant
        }
    }
    
    private var width_2:CGFloat {
        get {
            return self.view.layoutWidth.constant / 2.0
        }
    }
    
    private var height_2:CGFloat {
        get {
            return self.view.layoutHeight.constant / 2.0
        }
    }
    
    private func updatedPosition() {
        if let parent:DragParentProtocol = self as? DragParentProtocol {
            parent.updateChildPosition()
        }
    }
}
