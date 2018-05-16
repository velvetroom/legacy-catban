import Foundation

class PresenterUpdaterView:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var drag:Drag!
    
    required init() { }
    
    func update() {
        self.outlets.view?.title = self.viewModel.view.title
    }
}
