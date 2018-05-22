import UIKit
@testable import Canvas

class MockViewItem:ViewItem {
    var onStateHighlighted:(() -> Void)?
    var onStateNormal:(() -> Void)?
    var onStateMoving:(() -> Void)?
    var onTriggerAction:(() -> Void)?
    var onUpdatePosition:(() -> Void)?
    var onEndMoving:(() -> Void)?
    
    override func stateHighlighted() {
        self.onStateHighlighted?()
    }
    
    override func stateNormal() {
        self.onStateNormal?()
    }
    
    override func stateMoving() {
        self.onStateMoving?()
        super.stateMoving()
    }
    
    override func triggerAction(canvas:CanvasEditorProtocol) {
        self.onTriggerAction?()
    }
    
    override func update(position:CGPoint) {
        self.onUpdatePosition?()
    }
    
    override func endMoving() {
        self.onEndMoving?()
    }
}
