import UIKit

class PresenterDragStrategyCardStateDragging:PresenterDragStrategyCardStateProtocol {
    private var drop:PresenterDragStrategyCardDropProtocol
    private var originalPosition:CGPoint
    
    weak var strategy:PresenterDragStrategyCard! {
        didSet {
            self.bringViewToFront()
            self.saveOriginalPosition()
        }
    }
    
    private var newPosition:CGPoint {
        get {
            let movingDelta:CGPoint = self.strategy.deltaPosition
            let newX:CGFloat = self.originalPosition.x - movingDelta.x
            let newY:CGFloat = self.originalPosition.y - movingDelta.y
            return CGPoint(x:newX, y:newY)
        }
    }
    
    init() {
        self.originalPosition = CGPoint.zero
        self.drop = PresenterDragStrategyCardDropBack()
        self.drop.state = self
    }
    
    func moved() {
        self.updateViewPosition()
        self.drop.moved()
    }
    
    func endDragging() {
        self.drop.endDragging()
    }
    
    func backToOriginalPositition() {
        self.strategy.view?.layoutTop.constant = self.originalPosition.y
        self.strategy.view?.layoutLeft.constant = self.originalPosition.x
        self.animateView()
    }
    
    private func saveOriginalPosition() {
        guard
            let view:ViewBoardItem = self.strategy.view
        else { return }
        let top:CGFloat = view.layoutTop.constant
        let left:CGFloat = view.layoutLeft.constant
        self.originalPosition = CGPoint(x:left, y:top)
    }
    
    private func bringViewToFront() {
        guard
            let view:ViewBoardItem = self.strategy.view
        else { return }
        view.superview?.bringSubview(toFront:view)
    }
    
    private func updateViewPosition() {
        guard
            let view:ViewBoardItem = self.strategy.view
        else { return }
        let position:CGPoint = self.newPosition
        view.layoutTop.constant = position.y
        view.layoutLeft.constant = position.x
    }
    
    private func animateView() {
        UIView.animate(withDuration:PresenterConstants.Drag.animationDuration) { [weak self] in
            self?.strategy.view?.superview?.layoutIfNeeded()
        }
    }
}
