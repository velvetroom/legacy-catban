import Foundation

class PresenterUpdaterScroll:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    var drag:Drag!
    
    required init() { }
    
    func update() {
        self.outlets.viewScroll?.contentSize = self.viewModel.scroll.contentSize
        self.drag.viewScroll = self.outlets.viewScroll
    }
}
