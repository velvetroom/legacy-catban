import UIKit

class Drag {
    weak var viewScroll:ViewScroll!
    weak var viewBoard:ViewBoard!
    var column:DragColumn?
    
    func add(column:DragColumn) {
        column.minX = self.maxContentWidth
        if let lastColumn:DragColumn = self.lastColumn {
            lastColumn.nextColumn = column
        } else {
            self.column = column
        }
    }
    
    func add(item:DragItemProtocol) {
        if let column:DragColumn = self.columnFor(item:item) {
            column.add(item:item)
        }
        self.updateContentSize()
    }
    
    private func columnFor(item:DragItemProtocol) -> DragColumn? {
        var column:DragColumn? = self.column
        while let current:DragColumn = column {
            if current.maxX > item.midX {
                return current
            }
            column = current.nextColumn
        }
        return nil
    }
    
    private var lastColumn:DragColumn? {
        get {
            var column:DragColumn? = self.column
            while let _:DragColumn = column {
                column = column?.nextColumn
            }
            return column
        }
    }
    
    private var maxContentHeight:CGFloat {
        get {
            var maxHeight:CGFloat = 0
            var column:DragColumn? = self.column
            while let currentColumn:DragColumn = column {
                let columnMaxY:CGFloat = currentColumn.maxY
                if columnMaxY > maxHeight {
                    maxHeight = columnMaxY
                }
                column = currentColumn.nextColumn
            }
            return maxHeight + ViewConstants.Column.paddingBottom
        }
    }
    
    private var maxContentWidth:CGFloat {
        get {
            var width:CGFloat = ViewConstants.Board.paddingHorizontal
            if let lastColumn:DragColumn = self.lastColumn {
                width += lastColumn.maxX
            }
            return width
        }
    }
    
    private func updateContentSize() {
        self.viewScroll.contentSize.height = self.maxContentHeight
        self.viewScroll.contentSize.width = self.maxContentWidth
        self.viewBoard.frame = CGRect(origin:CGPoint.zero, size:self.viewScroll.contentSize)
    }
}
