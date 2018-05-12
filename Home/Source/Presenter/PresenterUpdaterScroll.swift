import Foundation

class PresenterUpdaterScroll:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    
    required init() { }
    
    func update() {
        self.outlets.viewScroll?.contentSize = self.viewModel.scroll.contentSize
    }
}
