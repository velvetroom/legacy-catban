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
        if let mapItem:MapItemProtocol = self.event.viewItem.mapNode as? MapItemProtocol {
            self.mapEditor.arrange(item:mapItem)
        }
        self.event.viewItem.endMoving()
        self.finishDrag()
    }
}
