import UIKit

class ViewBoardItem:UIView {
    var dragStrategy:PresenterDragStrategyProtocol.Type!
    var position:CGPoint
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutHeight:NSLayoutConstraint!
    weak var layoutWidth:NSLayoutConstraint!
    
    init() {
        self.position = CGPoint.zero
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    final func savePosition() {
        self.position = CGPoint(x:self.layoutLeft.constant, y:self.layoutTop.constant)
    }
    
    final func backToOriginalPosition() {
        self.layoutTop.constant = self.position.y
        self.layoutLeft.constant = self.position.x
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
