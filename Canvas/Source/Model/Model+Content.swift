import UIKit

extension Model {
    var contentHeight:CGFloat {
        get {
            var maxHeight:CGFloat = 0
            for column:MapColumnProtocol in self.columns {
                let height:CGFloat = column.height
                if height > maxHeight {
                    maxHeight = height
                }
            }
            return maxHeight
        }
    }
    
    var contentWidth:CGFloat {
        get {
            var width:CGFloat = Constants.Board.itemSpacing
            if let lastColumn:MapColumnProtocol = self.columns.last {
                width += lastColumn.maxX
            } else {
                width += Constants.Board.leftEdge
            }
            return width
        }
    }
    
    func updateSize() {
        let size:CGSize = CGSize(width:self.contentWidth, height:self.contentHeight)
        self.mapDelegate.mapChanged(size:size)
    }
}
