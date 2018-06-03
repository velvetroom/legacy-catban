import Foundation

extension DragStateProtocol {
    func triggerAction() {
        self.event.viewItem.triggerAction(canvas:self.event.canvas)
        self.changer.change(stateType:DragStateNone.self)
    }
    
    func finishDrag() {
        self.event.viewItem.stateNormal()
        self.changer.change(stateType:DragStateNone.self)
    }
    
    func update() { }
    func end() { }
}
