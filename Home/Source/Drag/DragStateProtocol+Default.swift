import Foundation

extension DragStateProtocol {
    func triggerAction() {
        self.drag.view.triggerAction(controller:self.drag.controller)
        self.drag.changeState(stateType:DragStateNone.self)
    }
    
    func finishDrag() {
        self.drag.view.stateNormal()
        self.drag.changeState(stateType:DragStateNone.self)
    }
    
    func update() { }
    func end() { }
}
