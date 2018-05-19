import Foundation
@testable import Canvas

class MockDragStateProtocol:DragStateProtocol {
    var event:DragEventProtocol!
    var changer:DragStateChangerProtocol!
    var mapEditor:MapEditorProtocol!
    
    required init() {
        
    }
}
