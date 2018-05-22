import UIKit

class ViewItem:UIView {
    var dragState:DragStateProtocol.Type!
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
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
    }
    
    func stateHighlighted() { }
    func stateNormal() { }
    func stateMoving() { }
    func endMoving() { }
    func update(position:CGPoint) { }
    func triggerAction(canvas:CanvasEditorProtocol) { }
}
