import UIKit
@testable import Canvas

class MockViewItemMapable:ViewItemMapable {
    var onStateHighlighted:(() -> Void)?
    var onStateNormal:(() -> Void)?
    var onTriggerAction:(() -> Void)?
    var onStateMoving:(() -> Void)?
    var onUpdatePosition:(() -> Void)?
    var onEndMoving:(() -> Void)?
    
    override func stateHighlighted() {
        self.onStateHighlighted?()
    }
    
    override func stateNormal() {
        self.onStateNormal?()
        super.stateNormal()
    }
    
    override func stateMoving() {
        self.onStateMoving?()
        super.stateMoving()
    }
    
    override func endMoving() {
        self.onEndMoving?()
    }
    
    override func triggerAction(canvas:CanvasEditorProtocol) {
        self.onTriggerAction?()
    }
    
    override func update(position:CGPoint) {
        self.onUpdatePosition?()
    }
}
