import UIKit

class ViewBoard:UIView {
    var columns:[ViewColumn]
    var items:[ViewBoardItem]
    var drag:PresenterDrag
    
    init() {
        self.columns = []
        self.items = []
        self.drag = PresenterDrag()
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?) {
        guard
            let touch:UITouch = touches.first,
            let view:ViewBoardItem = touch.view as? ViewBoardItem
        else { return }
        let position:CGPoint = touch.location(in:self)
        self.drag.beganDragging(view:view, on:self, at:position)
    }
    
    override func touchesMoved(_ touches:Set<UITouch>, with event:UIEvent?) {
        guard
            let touch:UITouch = touches.first
        else { return }
        let position:CGPoint = touch.location(in:self)
        self.drag.draggedTo(position:position)
    }
    
    override func touchesCancelled(_ touches:Set<UITouch>, with event:UIEvent?) {
        self.drag.dragEnded()
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?) {
        self.drag.dragEnded()
    }
    
    private func configureView() {
        self.clipsToBounds = true
    }
}
