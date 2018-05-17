import Foundation

class PresenterUpdaterScroll:PresenterUpdaterProtocol {
    weak var map:MapProtocol!
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    
    required init() { }
    
    func update() {
        self.map.viewScroll = self.outlets.viewScroll
    }
}
