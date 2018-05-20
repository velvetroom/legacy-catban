import UIKit

class ViewItem:ViewNode {
    weak var mapItem:MapItemProtocol!
    var dragState:DragStateProtocol.Type!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func factoryOutlets() { }
    func stateHighlighted() { }
    func stateNormal() { }
    func triggerAction(canvas:CanvasEditorProtocol) { }
    
    func bringToFront() {
        guard
            let superView:UIView = self.superview
        else { return }
        superView.bringSubview(toFront:self)
    }
    
    func animateChanges() {
        UIView.animate(withDuration:Constants.Generic.animationDuration) { [weak self] in
            self?.superview?.layoutIfNeeded()
        }
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
}
