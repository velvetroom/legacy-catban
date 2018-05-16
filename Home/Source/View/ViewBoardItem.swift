import UIKit

class ViewBoardItem:ViewBoardElement {
    var dragStrategy:PresenterDragStrategyProtocol.Type!
    
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
