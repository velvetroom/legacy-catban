import Foundation

class DragStateDynamic:DragStateProtocol {
    weak var drag:DragProtocol!
    weak var state:DragStateChangerProtocol!
    
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
        self.state.change(stateType:DragStateMoving.self)
    }
}
