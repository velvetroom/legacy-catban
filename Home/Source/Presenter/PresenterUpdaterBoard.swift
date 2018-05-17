import Foundation

class PresenterUpdaterBoard:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var drag:Map!
    
    required init() { }
    
    func update() {
        self.drag.viewBoard = self.outlets.viewBoard
    }
}
