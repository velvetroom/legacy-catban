import UIKit

class Drag {
    weak var controller:Controller!
    weak var map:Map!
    weak var view:ViewBoardItem!
    var mapItem:MapItemProtocol!
    var position:DragPosition
    private var state:DragStateProtocol
    
    init() {
        self.position = DragPosition()
        self.state = DragStateNone()
    }
    
    func beginWith(view:ViewBoardItem, and touch:CGPoint) {
        self.view = view
        self.mapItem = view.mapItem
        self.position.restartWith(item:self.mapItem, and:touch)
        self.changeState(stateType:self.view.dragState)
        self.view.stateHighlighted()
    }
    
    func update() {
        self.state.update()
    }
    
    func end() {
        self.state.end()
    }
    
    func changeState(stateType:DragStateProtocol.Type) {
        self.state = stateType.init()
        self.state.drag = self
    }
}
