import Foundation

class DragStateDynamic:DragStateProtocol {
    weak var event:DragEventProtocol!
    weak var changer:DragStateChangerProtocol!
    weak var mapEditor:MapEditorProtocol!
    
    required init() { }
    
    func update() {
        if self.event.position.isMoving {
            self.startMoving()
        }
    }
    
    func end() {
        self.triggerAction()
    }
    
    private func startMoving() {
        self.event.viewItem.bringToFront()
        self.event.mapItem.detach()
        self.event.viewItem.animateChanges()
        self.changer.change(stateType:DragStateMoving.self)
    }
}
