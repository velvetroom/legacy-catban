import UIKit
@testable import Home

class MockDragProtocol:DragProtocol {
    var map:MapProtocol!
    var controller:Controller!
    var view:ViewBoardItem!
    var mapItem:MapItemProtocol!
    var position:DragPosition
    
    init() {
        self.position = DragPosition()
    }
    
    func beginWith(view:ViewBoardItem, and touch:CGPoint) {
        
    }
    
    func update() {
        
    }
    
    func end() {
        
    }
}
