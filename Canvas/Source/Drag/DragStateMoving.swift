import Foundation

class DragStateMoving:DragStateProtocol {
    weak var event:DragEventProtocol!
    weak var changer:DragStateChangerProtocol!
    weak var mapEditor:MapEditorProtocol!
    
    required init() { }
    
    func update() {
        self.event.viewItem.update(position:self.event.position.updatedPosition)
    }
    
    func end() {
        self.mapEditor.arrange(item:self.event.viewItem.mapItem)
        self.event.viewItem.endMoving()
        self.finishDrag()
    }
}
