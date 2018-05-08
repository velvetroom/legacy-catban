import UIKit

class PresenterOutletsLoader {
    var outlets:PresenterOutlets
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func loadFor(view:UIView) {
        self.loadScroll(view:view)
        self.loadBoard()
    }
    
    private func loadScroll(view:UIView) {
        self.outlets.viewScroll = view as? ViewScroll
    }
    
    private func loadBoard() {
        let viewBoard:ViewBoard = ViewBoard()
        self.outlets.viewScroll?.addSubview(viewBoard)
        self.outlets.viewBoard = viewBoard
    }
}
