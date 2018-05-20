import Foundation
@testable import Canvas

class MockViewItem:ViewItem {
    var onStateHighlighted:(() -> Void)?
    var onStateNormal:(() -> Void)?
    var onTriggerAction:(() -> Void)?
    
    override func stateHighlighted() {
        self.onStateHighlighted?()
    }
    
    override func stateNormal() {
        self.onStateNormal?()
    }
    
    override func triggerAction(canvas:CanvasEditorProtocol) {
        self.onTriggerAction?()
    }
}
