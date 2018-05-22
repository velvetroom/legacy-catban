import UIKit

class ViewItemMapable:ViewItem {
    weak var mapItem:MapItemProtocol!

    override func stateMoving() {
        super.stateMoving()
        self.bringToFront()
        self.mapItem.detach()
        self.animateChanges()
    }
    
    override func endMoving() {
        super.endMoving()
        self.animateChanges()
    }
    
    override func update(position:CGPoint) {
        super.update(position:position)
        self.mapItem.minX = position.x
        self.mapItem.minY = position.y
        self.animateChanges()
    }
    
    private func bringToFront() {
        guard
            let superView:UIView = self.superview
        else { return }
        superView.bringSubview(toFront:self)
    }
    
    private func animateChanges() {
        UIView.animate(withDuration:Constants.Generic.animationDuration) { [weak self] in
            self?.superview?.layoutIfNeeded()
        }
    }
}
