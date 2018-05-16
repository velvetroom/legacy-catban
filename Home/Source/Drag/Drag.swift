import UIKit

class Drag {
    weak var viewScroll:ViewScroll!
    weak var viewBoard:ViewBoard!
    var firstColumn:DragColumn?
    
    func add(item:DragItemProtocol) {
        if let column:DragColumn = self.columnFor(item:item) {
            
        }
        self.updateContentSize()
    }
    
    private func columnFor(item:DragItemProtocol) -> DragColumn? {
        var column:DragColumn? = self.firstColumn
        while let current:DragColumn = column {
            if current.maxX > item.midX {
                return current
            }
            column = current.nextColumn
        }
        return nil
    }
    
    private var maxContentHeight:CGFloat {
        get {
            var maxHeight:CGFloat = 0
            var column:DragColumn? = self.firstColumn
            while let currentColumn:DragColumn = column {
                let columnMaxY:CGFloat = currentColumn.maxY
                if columnMaxY > maxHeight {
                    maxHeight = columnMaxY
                }
                column = currentColumn.nextColumn
            }
            return maxHeight
        }
    }
    
    private func updateContentSize() {
        self.viewScroll.contentSize.height = self.maxContentHeight
        self.viewBoard.frame = CGRect(origin:CGPoint.zero, size:self.viewScroll.contentSize)
    }
}
