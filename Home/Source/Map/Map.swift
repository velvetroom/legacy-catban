import UIKit

class Map {
    weak var viewScroll:ViewScroll!
    private var columns:[MapColumn]
    
    init() {
        self.columns = []
    }
    
    func add(column:MapColumn) {
        column.minX = self.maxContentWidth
        self.columns.append(column)
    }
    
    func add(item:MapItemProtocol) {
        var parentColumn:MapColumn? = self.columns.first
        for column:MapColumn in self.columns {
            if column.maxX > item.midX {
                parentColumn = column
                break
            }
        }
        parentColumn?.add(item:item)
        self.updateContentSize()
    }
    
    func updateContentSize() {
        let size:CGSize = CGSize(width:self.maxContentWidth, height:self.maxContentHeight)
        self.viewScroll.updateContent(size:size)
    }
    
    private var maxContentHeight:CGFloat {
        get {
            var maxHeight:CGFloat = 0
            for column:MapColumn in self.columns {
                guard
                    let columnMaxY:CGFloat = column.lastItem?.maxY,
                    columnMaxY > maxHeight
                else { continue }
                maxHeight = columnMaxY
            }
            return maxHeight
        }
    }
    
    private var maxContentWidth:CGFloat {
        get {
            var width:CGFloat = ViewConstants.Board.paddingHorizontal
            if let lastColumn:MapColumn = self.columns.last {
                width += lastColumn.maxX
            }
            return width
        }
    }
}
