import Foundation
@testable import Canvas

class MockViewItem:ViewItem {
    var onStateHighlighted:(() -> Void)?
    var onStateNormal:(() -> Void)?
    var onTriggerAction:(() -> Void)?
    var onBringToFront:(() -> Void)?
    var onAnimateChanges:(() -> Void)?
    
    override func stateHighlighted() {
        self.onStateHighlighted?()
    }
    
    override func stateNormal() {
        self.onStateNormal?()
    }
    
    override func triggerAction(canvas:CanvasEditorProtocol) {
        self.onTriggerAction?()
    }
    
    override func bringToFront() {
        self.onBringToFront?()
    }
    
    override func animateChanges() {
        self.onAnimateChanges?()
    }
}
