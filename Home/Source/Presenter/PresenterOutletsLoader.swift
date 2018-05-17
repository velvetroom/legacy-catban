import Foundation
import Shared

class PresenterOutletsLoader {
    weak var view:Shared.View!
    weak var presenter:Presenter!
    
    func loadOutlets() {
        self.loadView()
        self.loadScroll()
        self.loadBoard()
    }
    
    private func loadView() {
        self.presenter.outlets.view = view
    }
    
    private func loadScroll() {
        self.presenter.outlets.viewScroll = self.view.view as? ViewScroll
    }
    
    private func loadBoard() {
        let viewBoard:ViewBoard = ViewBoard()
        viewBoard.drag.controller = self.presenter.controller
        self.presenter.outlets.viewBoard = viewBoard
        self.presenter.outlets.viewScroll?.addSubview(viewBoard)
    }
}
