import Foundation

class PresenterUpdaterBoard:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var drag:Drag!
    
    required init() { }
    
    func update() {
        self.drag.viewBoard = self.outlets.viewBoard
    }
}
