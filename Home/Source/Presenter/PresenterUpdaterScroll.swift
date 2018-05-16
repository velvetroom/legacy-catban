import Foundation

class PresenterUpdaterScroll:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var drag:Drag!
    
    required init() { }
    
    func update() {
        self.drag.viewScroll = self.outlets.viewScroll
    }
}
