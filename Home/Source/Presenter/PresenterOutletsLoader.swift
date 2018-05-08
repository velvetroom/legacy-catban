import Foundation

class PresenterOutletsLoader {
    var outlets:PresenterOutlets
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func loadFor(view:View) {
        self.loadScroll(view:view)
        self.loadBoard()
    }
    
    private func loadScroll(view:View) {
        self.outlets.viewScroll = view.view as? ViewScroll
    }
    
    private func loadBoard() {
        let viewBoard:ViewBoard = ViewBoard()
        self.outlets.viewScroll?.addSubview(viewBoard)
        self.outlets.viewBoard = viewBoard
    }
}
