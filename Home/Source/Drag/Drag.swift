import UIKit

class Drag:DragProtocol, DragStateChangerProtocol {
    weak var map:MapProtocol!
    weak var controller:Controller!
    weak var view:ViewBoardItem!
    var mapItem:MapItemProtocol!
    var position:DragPosition
    var state:DragStateProtocol
    
    init() {
        self.position = DragPosition()
        self.state = DragStateNone()
    }
    
    func beginWith(view:ViewBoardItem, and touch:CGPoint) {
        self.view = view
        self.mapItem = view.mapItem
        self.position.restartWith(item:self.mapItem, and:touch)
        self.change(stateType:self.view.dragState)
        self.view.stateHighlighted()
    }
    
    func update() {
        self.state.update()
    }
    
    func end() {
        self.state.end()
    }
    
    func change(stateType:DragStateProtocol.Type) {
        self.state = stateType.init()
        self.state.drag = self
    }
}
