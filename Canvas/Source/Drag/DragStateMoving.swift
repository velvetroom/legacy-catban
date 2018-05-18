import Foundation

class DragStateMoving:DragStateProtocol {
    weak var event:DragEventProtocol!
    weak var changer:DragStateChangerProtocol!
    weak var mapEditor:MapEditorProtocol!
    
    required init() { }
    
    func update() {
        self.event.position.update(item:self.event.mapItem)
        self.event.viewItem.animateChanges()
    }
    
    func end() {
        self.mapEditor.add(item:self.event.mapItem)
        self.event.viewItem.animateChanges()
        self.finishDrag()
    }
}
