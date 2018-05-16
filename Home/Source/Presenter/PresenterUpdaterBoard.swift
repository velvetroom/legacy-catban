import Foundation

class PresenterUpdaterBoard:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    var drag:Drag!
    
    required init() { }
    
    func update() {
        self.outlets.viewBoard?.frame = self.viewModel.board.frame
        self.drag.viewBoard = self.outlets.viewBoard
    }
}
