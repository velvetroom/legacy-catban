import Foundation
@testable import Canvas

class MockDragEventProtocol:DragEventProtocol {
    var position:DragPosition
    var viewItem:ViewItem!
    var mapItem:MapItemProtocol!
    var canvas:CanvasEditorProtocol!
    
    init() {
        self.position = DragPosition()
    }
}
