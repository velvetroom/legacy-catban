import Foundation

class PresenterUpdaterView:PresenterUpdaterProtocol {
    weak var map:MapProtocol!
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    
    required init() { }
    
    func update() {
        self.outlets.view?.title = self.viewModel.view.title
    }
}
