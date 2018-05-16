import UIKit

extension DragObjectProtocol {
    var view:ViewBoardElement! {
        get {
            return self.position.view
        }
        set(newValue) {
            self.position.view = self.view
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
    
    private func updatedPosition() {
        if let parent:DragParentProtocol = self as? DragParentProtocol {
            parent.updateChildPosition()
        }
    }
}
