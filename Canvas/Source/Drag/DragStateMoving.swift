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
        if let view:ViewItemMapable = self.event.viewItem as? ViewItemMapable {
            self.mapEditor.arrange(item:view.mapItem)
        }
        self.event.viewItem.endMoving()
        self.finishDrag()
    }
}
