import UIKit

class ViewBoardItem:ViewBoardElement {
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
    func touchSucceded(controller:Controller) { }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
}
