import UIKit

class ViewItem:UIView {
    var dragState:DragStateProtocol.Type!
    weak var mapItem:MapItemProtocol!
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutWidth:NSLayoutConstraint!
    weak var layoutHeight:NSLayoutConstraint!
    
    var position:CGPoint {
        get {
            return CGPoint(x:self.layoutLeft.constant, y:self.layoutTop.constant)
        }
    }
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
        self.stateNormal()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func factoryOutlets() { }
    func stateHighlighted() { }
    func stateNormal() { }
    func triggerAction(canvas:CanvasEditorProtocol) { }
    
    
    func stateMoving() {
        self.bringToFront()
        self.mapItem.detach()
        self.animateChanges()
    }
    
    func endMoving() {
        self.animateChanges()
    }
    
    func update(position:CGPoint) {
        self.mapItem.minX = position.x
        self.mapItem.minY = position.y
        self.animateChanges()
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
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
