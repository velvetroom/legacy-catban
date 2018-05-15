import UIKit

class PresenterDragStrategyCardStateDraggingAnimation {
    private var originalPosition:CGPoint
    weak var view:ViewBoardItem? {
        didSet {
            self.saveOriginalPosition()
            self.bringViewToFront()
        }
    }
    
    init() {
        self.originalPosition = CGPoint.zero
    }
    
    func updateViewPositionWith(deltaPosition:CGPoint) {
        guard
            let view:ViewBoardItem = self.view
        else { return }
        let newX:CGFloat = self.originalPosition.x - deltaPosition.x
        let newY:CGFloat = self.originalPosition.y - deltaPosition.y
        let position:CGPoint = CGPoint(x:newX, y:newY)
        view.layoutTop.constant = position.y
        view.layoutLeft.constant = position.x
    }
    
    private func saveOriginalPosition() {
        guard
            let view:ViewBoardItem = self.view
        else { return }
        let top:CGFloat = view.layoutTop.constant
        let left:CGFloat = view.layoutLeft.constant
        self.originalPosition = CGPoint(x:left, y:top)
    }
    
    func backToOriginalPositition() {
        self.view?.layoutTop.constant = self.originalPosition.y
        self.view?.layoutLeft.constant = self.originalPosition.x
        self.animateView()
    }
    
    private func bringViewToFront() {
        guard
            let view:ViewBoardItem = self.view
        else { return }
        view.superview?.bringSubview(toFront:view)
    }
    
    private func animateView() {
        UIView.animate(withDuration:PresenterConstants.Drag.animationDuration) { [weak self] in
            self?.view?.superview?.layoutIfNeeded()
        }
    }
}
