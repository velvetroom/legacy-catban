import UIKit

class PresenterDragStrategyCardStateDraggingAnimation {
    weak var view:ViewBoardItem? {
        didSet {
            self.bringViewToFront()
        }
    }
    
    func updateView(position:CGPoint) {
        self.view?.layoutTop.constant = position.y
        self.view?.layoutLeft.constant = position.x
    }
    
    func backToOriginalPositition() {
        self.view?.backToOriginalPosition()
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
