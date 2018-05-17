import Foundation

class PresenterUpdaterBoard:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var map:Map!
    
    required init() { }
    
    func update() {
        self.outlets.viewBoard?.drag.map = self.map
    }
}
