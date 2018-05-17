import UIKit

class ViewBoard:UIView {
    let drag:Drag
    
    init() {
        self.drag = Drag()
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func removeSubviews() {
        for subview:UIView in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with:UIEvent?) {
        guard
            let touch:UITouch = touches.first,
            let view:ViewBoardItem = touch.view as? ViewBoardItem
        else { return }
        let position:CGPoint = touch.location(in:self)
        self.drag.beginWith(view:view, and:position)
    }
    
    override func touchesMoved(_ touches:Set<UITouch>, with:UIEvent?) {
        guard
            let touch:UITouch = touches.first
        else { return }
        let position:CGPoint = touch.location(in:self)
        self.drag.position.latestTouch = position
        self.drag.update()
    }
    
    override func touchesCancelled(_ touches:Set<UITouch>, with:UIEvent?) {
        self.drag.end()
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with:UIEvent?) {
        self.drag.end()
    }
    
    private func configureView() {
        self.clipsToBounds = false
    }
}
