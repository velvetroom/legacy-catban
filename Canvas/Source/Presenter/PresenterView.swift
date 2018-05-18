import Foundation

class PresenterView:PresenterBuilderProtocol {
    weak var map:MapProtocol!
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    
    required init() { }
    
    func update() {
        self.outlets.viewBoard?.drag.map = self.map
    }
}
