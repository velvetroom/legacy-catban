import Foundation

class DragStateFixed:DragStateProtocol {
    weak var event:DragEventProtocol!
    weak var changer:DragStateChangerProtocol!
    weak var mapEditor:MapEditorProtocol!
    
    required init() { }
    
    func update() {
        if self.event.position.isMoving {
            self.finishDrag()
        }
    }
    
    func end() {
        self.triggerAction()
    }
}
