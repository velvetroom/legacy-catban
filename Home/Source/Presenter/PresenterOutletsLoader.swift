import Foundation
import Shared

class PresenterOutletsLoader {
    var outlets:PresenterOutlets
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func loadFor(view:Shared.View) {
        self.loadView(view:view)
        self.loadScroll()
        self.loadBoard()
    }
    
    private func loadView(view:Shared.View) {
        self.outlets.view = view
    }
    
    private func loadScroll() {
        self.outlets.viewScroll = self.outlets.view?.view as? ViewScroll
    }
    
    private func loadBoard() {
        let viewBoard:ViewBoard = ViewBoard()
        self.outlets.viewScroll?.addSubview(viewBoard)
        self.outlets.viewBoard = viewBoard
    }
}
