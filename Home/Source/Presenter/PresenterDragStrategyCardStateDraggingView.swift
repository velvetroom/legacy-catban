import UIKit

class PresenterDragStrategyCardStateDraggingView {
    weak var view:ViewBoardItem? {
        didSet {
            guard
                let view:ViewBoardItem = self.view
            else { return }
            view.superview?.bringSubview(toFront:view)
//            self.prospectPosition = view.position
//            self.originalPosition = view.position
        }
    }
    
    var cardsBelow:[ViewCard] {
        get {
            return self.childCards
        }
        
        set(newCardsBelow) {
            
            self.childCards = newCardsBelow
        }
    }
    
    var prospectPosition:CGPoint
    private var childCards:[ViewCard]
    private var originalPosition:CGPoint
    
    init() {
        self.prospectPosition = CGPoint.zero
        self.originalPosition = CGPoint.zero
        self.childCards = []
    }
    
    func updateView(position:CGPoint) {
        self.view?.layoutTop.constant = position.y
        self.view?.layoutLeft.constant = position.x
    }
    
    func animateDrop() {
        self.view?.layoutTop.constant = self.prospectPosition.y
        self.view?.layoutLeft.constant = self.prospectPosition.x
        UIView.animate(withDuration:PresenterConstants.Drag.animationDuration) { [weak self] in
            self?.view?.superview?.layoutIfNeeded()
        }
    }
    
    func updatedRectWith(deltaPosition:CGPoint) -> CGRect {
        var rect:CGRect = CGRect.zero
        if let view:ViewBoardItem = self.view {
            rect = CGRect(
                x:self.originalPosition.x - deltaPosition.x,
                y:self.originalPosition.y - deltaPosition.y,
                width:view.layoutWidth.constant,
                height:view.layoutHeight.constant)
        }
        return rect
    }
}
