import UIKit

class Model:ModelProtocol {
    weak var canvas:CanvasProtocol!
    weak var mapDelegate:MapDelegateProtocol!
    weak var viewItem:ViewItem!
    var mapItem:MapItemProtocol!
    var position:DragPosition
    var state:DragStateProtocol
    var columns:[MapColumn]
    var size:CGSize
    var lastTouch:CGPoint
    
    init() {
        self.columns = []
        self.position = DragPosition()
        self.state = DragStateNone()
    }
    
    func clear() {
        self.columns = []
    }
    
    func add(column:MapColumn) {
        column.minX = self.maxContentWidth
        self.columns.append(column)
        self.updateSize()
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
        self.updateSize()
    }
    
    func dragBegin() {
        self.mapItem = self.viewItem.mapItem
        self.position.restartWith(item:self.mapItem, and:self.lastTouch)
        self.change(stateType:self.viewItem.dragState)
        self.viewItem.stateHighlighted()
    }
    
    func dragUpdate() {
        self.state.update()
    }
    
    func dragEnd() {
        self.state.end()
    }
    
    func change(stateType:DragStateProtocol.Type) {
        self.state = stateType.init()
        self.state.drag = self
        self.state.state = self
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
    
    private func updateSize() {
        self.size = CGSize(width:self.maxContentWidth, height:self.maxContentHeight)
    }
}
