import Foundation
import Shared

class PresenterOutletsLoader {
    weak var view:Shared.View!
    private var outlets:PresenterOutlets
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func loadOutlets() -> PresenterOutlets {
        self.loadView()
        self.loadScroll()
        self.loadBoard()
        return self.outlets
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
