import Foundation

class DragStateMoving:DragStateProtocol {
    weak var drag:DragProtocol!
    weak var state:DragStateChangerProtocol!
    
    required init() { }
    
    func update() {
        self.drag.position.update(item:self.drag.mapItem)
        self.drag.view.animateChanges()
    }
    
    func end() {
        self.drag.map.add(item:self.drag.mapItem)
        self.drag.view.animateChanges()
        self.finishDrag()
    }
}
