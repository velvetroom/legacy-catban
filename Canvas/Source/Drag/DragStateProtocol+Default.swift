import Foundation

extension DragStateProtocol {
    func triggerAction() {
        self.drag.view.triggerAction(controller:self.drag.controller)
        self.state.change(stateType:DragStateNone.self)
    }
    
    func finishDrag() {
        self.drag.view.stateNormal()
        self.state.change(stateType:DragStateNone.self)
    }
    
    func update() { }
    func end() { }
}
