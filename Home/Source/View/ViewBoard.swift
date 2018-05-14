import UIKit

class ViewBoard:UIView {
    var columns:[ViewColumn]
    var items:[ViewBoardItem]
    weak var dragDelegate:PresenterBoardDragProtocol!
    
    init() {
        self.columns = []
        self.items = []
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryGestures()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    @objc func selectorPan(sender gesture:UIPanGestureRecognizer) {
        let gestureState:UIGestureRecognizerState = gesture.state
        let state:PresenterBoardDragState = PresenterBoardDragStateFactory.factoryStateWith(state:gestureState)
        let point:CGPoint = gesture.location(in:self)
        self.dragDelegate.updated(state:state, at:point)
    }
    
    private func configureView() {
        self.clipsToBounds = true
    }
    
    private func factoryGestures() {
        let pan:UIPanGestureRecognizer = UIPanGestureRecognizer(target:self,
                                                                action:#selector(self.selectorPan(sender:)))
        self.addGestureRecognizer(pan)
    }
}
