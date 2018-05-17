import Foundation

class DragStateFixed:DragStateProtocol {
    weak var drag:Drag!
    
    required init() { }
    
    func update() {
        if self.drag.position.isMoving {
            self.cancelDrag()
        }
    }
    
    func end() {
        self.triggerAction()
    }
}
