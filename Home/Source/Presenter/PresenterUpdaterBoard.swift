import Foundation

class PresenterUpdaterBoard:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var map:Map!
    
    required init() { }
    
    func update() {
        self.map.viewBoard = self.outlets.viewBoard
    }
}
