import UIKit

class DragStateMoving:DragStateProtocol {
    weak var drag:Drag!
    
    required init() { }
    
    func update() {
        self.drag.position.update(item:self.drag.view.mapItem)
    }
    
    func end() {
        self.finishDrag()
    }
}
