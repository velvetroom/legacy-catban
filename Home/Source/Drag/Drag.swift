import UIKit

class Drag {
    var columns:[DragColumn]
    weak var viewScroll:ViewScroll!
    weak var viewBoard:ViewBoard!
    
    var width:CGFloat {
        get {
            return self.viewScroll.contentSize.width
        }
        set(newValue) {
            self.viewScroll.contentSize.width = newValue
            self.updateBoardFrame()
        }
    }
    
    var height:CGFloat {
        get {
            return self.viewScroll.contentSize.height
        }
        set(newValue) {
            self.viewScroll.contentSize.height = newValue
            self.updateBoardFrame()
        }
    }
    
    init() {
        self.columns = []
    }
    
    private func updateBoardFrame() {
        self.viewBoard.frame = CGRect(origin:CGPoint.zero, size:self.viewScroll.contentSize)
    }
}
