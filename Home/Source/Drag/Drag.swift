import Foundation

class Drag {
    weak var controller:Controller!
    weak var map:Map!
    weak var view:ViewBoardItem!
    var position:DragPosition
    private var state:DragStateProtocol
    
    init() {
        self.position = DragPosition()
        self.state = DragStateNone()
    }
    
    func begin() {
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
