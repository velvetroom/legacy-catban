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
}
