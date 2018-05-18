import UIKit

class ViewContent:UIView {
    weak var drag:DragProtocol!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func clear() {
        for subview:UIView in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with:UIEvent?) {
        guard
            let touch:UITouch = touches.first,
            let view:ViewItem = touch.view as? ViewItem
        else { return }
        self.drag.latestTouch = touch.location(in:self)
        self.drag.viewItem = view
        self.drag.dragBegin()
    }
    
    override func touchesMoved(_ touches:Set<UITouch>, with:UIEvent?) {
        guard
            let touch:UITouch = touches.first
        else { return }
        self.drag.latestTouch = touch.location(in:self)
        self.drag.dragUpdate()
    }
    
    override func touchesCancelled(_ touches:Set<UITouch>, with:UIEvent?) {
        self.drag.dragEnd()
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with:UIEvent?) {
        self.drag.dragEnd()
    }
    
    private func configureView() {
        self.clipsToBounds = false
    }
}
