import Foundation

class DragStateFixed:DragStateProtocol {
    weak var drag:DragProtocol!
    weak var state:DragStateChangerProtocol!
    
    required init() { }
    
    func update() {
        if self.drag.position.isMoving {
            self.finishDrag()
        }
    }
    
    func end() {
        self.triggerAction()
    }
}
