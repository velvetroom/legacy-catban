import UIKit

class Drag {
    weak var viewScroll:ViewScroll!
    weak var viewBoard:ViewBoard!
    var firstColumn:DragColumn?
    
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
    
    func columnFor(item:DragItemProtocol) -> DragColumn {
        var found:DragColumn!
        for column:DragColumn in self.columns {
            if column.maxX > item.midX {
                found = column
                break
            }
        }
        return found
    }
    
    func add(item:DragItemProtocol) {
        let column:DragColumn = self.columnFor(item:item)
    }
    
    private func updateBoardFrame() {
        self.viewBoard.frame = CGRect(origin:CGPoint.zero, size:self.viewScroll.contentSize)
    }
}
