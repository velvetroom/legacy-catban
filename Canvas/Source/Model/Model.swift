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
    
    private func add(column:MapColumnProtocol) {
        column.minX = self.contentWidth
        self.columns.append(column)
    }
}
