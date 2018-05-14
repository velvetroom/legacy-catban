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
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?) {
        guard
            let touch:UITouch = touches.first,
            let view:ViewCard = touch.view as? ViewCard
        else {
            print(touches.first?.view)
            return
        }
        let location:CGPoint = touch.location(in:self)
        self.dragDelegate.beganDragging(view:view, at:location)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event:UIEvent?) {
        guard
            let touch:UITouch = touches.first
        else { return }
        let location:CGPoint = touch.location(in:self)
        self.dragDelegate.draggedTo(position:location)
    }
    
    override func touchesCancelled(_ touches:Set<UITouch>, with event:UIEvent?) {
        self.dragDelegate.dragEnded()
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?) {
        self.dragDelegate.dragEnded()
    }
    
    private func configureView() {
        self.clipsToBounds = true
    }
}
