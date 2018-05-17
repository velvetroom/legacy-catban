import UIKit

class Map {
    weak var viewScroll:ViewScroll!
    weak var viewBoard:ViewBoard!
    var column:MapColumn?
    
    func add(column:MapColumn) {
        column.minX = self.maxContentWidth
        if let lastColumn:MapColumn = self.lastColumn {
            lastColumn.nextColumn = column
        } else {
            self.column = column
        }
        self.updateContentSize()
    }
    
    func add(item:MapItemProtocol) {
        if let column:MapColumn = self.columnFor(item:item) {
            column.add(item:item)
        }
        self.updateContentSize()
    }
    
    private func columnFor(item:MapItemProtocol) -> MapColumn? {
        var column:MapColumn? = self.column
        while let current:MapColumn = column {
            if current.maxX > item.midX {
                return current
            }
            column = current.nextColumn
        }
        return nil
    }
    
    private var lastColumn:MapColumn? {
        get {
            var column:MapColumn? = self.column
            while let nextColumn:MapColumn = column?.nextColumn {
                column = nextColumn
            }
            return column
        }
    }
    
    private var maxContentHeight:CGFloat {
        get {
            var maxHeight:CGFloat = 0
            var column:MapColumn? = self.column
            while let currentColumn:MapColumn = column {
                let columnMaxY:CGFloat = currentColumn.maxY
                if columnMaxY > maxHeight {
                    maxHeight = columnMaxY
                }
                column = currentColumn.nextColumn
            }
            return maxHeight
        }
    }
    
    private var maxContentWidth:CGFloat {
        get {
            var width:CGFloat = ViewConstants.Board.paddingHorizontal
            if let lastColumn:MapColumn = self.lastColumn {
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
