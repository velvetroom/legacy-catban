import Foundation
import Shared

class PresenterOutletsLoader {
    var outlets:PresenterOutlets
    private weak var view:Shared.View!
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func loadFor(view:Shared.View) {
        self.view = view
        self.loadView()
        self.loadScroll()
        self.loadBoard()
    }
    
    private func loadView() {
        self.outlets.view = view
    }
    
    private func loadScroll() {
        self.outlets.viewScroll = self.view.view as? ViewScroll
    }
    
    private func loadBoard() {
        let viewBoard:ViewBoard = ViewBoard()
        self.outlets.viewBoard = viewBoard
        self.outlets.viewScroll?.addSubview(viewBoard)
    }
}
