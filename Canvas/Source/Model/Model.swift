import UIKit

class Model:ModelProtocol, DragEventProtocol, DragStateChangerProtocol {
    weak var canvas:CanvasEditorProtocol!
    weak var mapDelegate:MapDelegateProtocol!
    weak var viewItem:ViewItem!
    var mapItem:MapItemProtocol!
    var columns:[MapColumnProtocol]
    var position:DragPosition
    var state:DragStateProtocol
    var latestTouch:CGPoint
    
    init() {
        self.columns = []
        self.latestTouch = CGPoint.zero
        self.position = DragPosition()
        self.state = DragStateNone()
    }
    
    func clear() {
        self.columns = []
    }
    
    func add(columns:[MapColumnProtocol]) {
        for column:MapColumnProtocol in columns {
            self.add(column:column)
        }
        self.updateSize()
    }
    
    func order(item:MapItemProtocol) {
        var parentColumn:MapColumnProtocol? = self.columns.first
        for column:MapColumnProtocol in self.columns {
            parentColumn = column
            if column.maxX > item.midX {
                break
            }
        }
        parentColumn?.order(item:item)
        self.updateSize()
    }
    
    func dragBegin() {
        self.mapItem = self.viewItem.mapItem
        self.position.restartWith(item:self.mapItem, and:self.latestTouch)
        self.change(stateType:self.viewItem.dragState)
        self.viewItem.stateHighlighted()
    }
    
    func dragUpdate() {
        self.position.latestTouch = self.latestTouch
        self.state.update()
    }
    
    func dragEnd() {
        self.state.end()
    }
    
    func change(stateType:DragStateProtocol.Type) {
        self.state = stateType.init()
        self.state.event = self
        self.state.changer = self
        self.state.mapEditor = self
    }
    
    private func add(column:MapColumnProtocol) {
        column.minX = self.maxContentWidth
        self.columns.append(column)
    }
    
    private var maxContentHeight:CGFloat {
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
    
    private var maxContentWidth:CGFloat {
        get {
            var width:CGFloat = Constants.Board.paddingHorizontal
            if let lastColumn:MapColumnProtocol = self.columns.last {
                width += lastColumn.maxX
            }
            return width
        }
    }
    
    private func updateSize() {
        let size:CGSize = CGSize(width:self.maxContentWidth, height:self.maxContentHeight)
        self.mapDelegate.mapChanged(size:size)
    }
}
