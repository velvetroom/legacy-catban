import UIKit

protocol PresenterBoardDragProtocol:class {
    func beganDragging(view:ViewCard, at position:CGPoint)
    func draggedTo(position:CGPoint)
    func dragEnded()
}
