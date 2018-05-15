import UIKit

class ViewBoardItem:UIView {
    var dragStrategy:PresenterDragStrategyProtocol.Type!
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutHeight:NSLayoutConstraint!
    weak var layoutWidth:NSLayoutConstraint!
    var position:CGPoint {
        get {
            return CGPoint(x:self.layoutLeft.constant, y:self.layoutTop.constant)
        }
    }
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func factoryOutlets() { }
    func dragStart() { }
    func drag(delta:CGPoint) { }
    func dragEnd() { }
    func touchSucceded(controller:Controller) { }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
}
