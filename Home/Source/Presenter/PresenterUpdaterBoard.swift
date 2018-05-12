import Foundation

class PresenterUpdaterBoard:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    
    required init() { }
    
    func update() {
        self.outlets.viewBoard?.frame = self.viewModel.board.frame
    }
}
