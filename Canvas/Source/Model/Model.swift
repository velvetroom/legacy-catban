import UIKit
import Board

class Model:ModelProtocol, DragEventProtocol, DragStateChangerProtocol {
    weak var canvas:CanvasEditorProtocol!
    weak var mapDelegate:MapDelegateProtocol!
    weak var viewItem:ViewItem!
    weak var projectOrder:ProjectOrderProtocol!
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
    
    func arrange(item:MapItemProtocol) {
        self.arrengeInColumns(item:item)
        self.afterArrange()
    }
    
    private func afterArrange() {
        self.updateSize()
        self.updateProject()
    }
}
