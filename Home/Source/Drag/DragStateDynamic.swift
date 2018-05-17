import Foundation

class DragStateDynamic:DragStateProtocol {
    weak var drag:Drag!
    
    required init() { }
    
    func update() {
        if self.drag.position.isMoving {
            self.startMoving()
        }
    }
    
    func end() {
        self.triggerAction()
    }
    
    private func startMoving() {
        self.drag.view.bringToFront()
        self.drag.mapItem.detach()
        self.drag.view.animateChanges()
        self.drag.changeState(stateType:DragStateMoving.self)
    }
}
