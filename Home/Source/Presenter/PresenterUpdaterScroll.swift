import Foundation

class PresenterUpdaterScroll:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var map:Map!
    
    required init() { }
    
    func update() {
        self.map.viewScroll = self.outlets.viewScroll
    }
}
