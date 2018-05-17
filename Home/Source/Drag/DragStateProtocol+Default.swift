import Foundation

extension DragStateProtocol {
    func triggerAction() {
        self.drag.changeState(stateType:DragStateNone.self)
    }
    
    func cancelDrag() {
        self.drag.changeState(stateType:DragStateNone.self)
    }
    
    func update() { }
    func end() { }
}
