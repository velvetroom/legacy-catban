import UIKit

class PresenterBoardDrag:PresenterBoardDragProtocol {
    func beganDragging(view:ViewCard, at position:CGPoint) {
        print("dragging \(position)")
    }
    
    func draggedTo(position:CGPoint) {
        
    }
    
    func dragEnded() {
        
    }
}
