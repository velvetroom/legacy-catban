import UIKit

class ViewItem:ViewNode {
    var dragState:DragStateProtocol.Type!
    
    override init() {
        super.init()
        self.stateNormal()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func stateHighlighted() { }
    func stateNormal() { }
    func stateMoving() { }
    func endMoving() { }
    func update(position:CGPoint) { }
    func triggerAction(canvas:CanvasEditorProtocol) { }
}
