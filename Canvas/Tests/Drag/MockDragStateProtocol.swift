import Foundation
@testable import Canvas

class MockDragStateProtocol:DragStateProtocol {
    var onUpdate:(() -> Void)?
    var onEnd:(() -> Void)?
    var event:DragEventProtocol!
    var changer:DragStateChangerProtocol!
    var mapEditor:MapEditorProtocol!
    
    required init() { }
    
    func update() {
        self.onUpdate?()
    }
    
    func end() {
        self.onEnd?()
    }
}
