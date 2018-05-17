import UIKit

class DragStateMoving:DragStateProtocol {
    weak var drag:Drag!
    
    required init() { }
    
    func update() {
        self.drag.position.update(item:self.drag.mapItem)
    }
    
    func end() {
        self.finishDrag()
    }
}
