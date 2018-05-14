import UIKit
@testable import Home

class MockPresenterBoardDragProtocol:PresenterBoardDragProtocol {
    var onBeganDragging:((ViewCard, CGPoint) -> Void)?
    var onDraggedTo:((CGPoint) -> Void)?
    var onDragEnded:(() -> Void)?
    
    func beganDragging(view:ViewCard, at position:CGPoint) {
        self.onBeganDragging?(view, position)
    }
    
    func draggedTo(position:CGPoint) {
        self.onDraggedTo?(position)
    }
    
    func dragEnded() {
        self.onDragEnded?()
    }
}
