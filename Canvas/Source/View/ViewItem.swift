import UIKit

class ViewItem:UIView {
    var dragState:DragStateProtocol.Type!
    var mapNode:MapNodeProtocol!
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
        if let mapItem:MapItemProtocol = self.mapNode as? MapItemProtocol {
            mapItem.detach()
        }
        self.animateChanges()
    }
    
    func endMoving() {
        self.animateChanges()
    }
    
    func update(position:CGPoint) {
        self.mapNode.minX = position.x
        self.mapNode.minY = position.y
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
