import Foundation
import Shared
import Board

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    var outlets:PresenterOutlets
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol?
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func didLoad(view:Shared.View) {
        self.loadOutlets(view:view)
        self.delegate?.didLoadPresenter()
    }
    
    func shouldUpdate() {
        let builder:ViewModelBuilder = ViewModelBuilder()
        builder.buildWith(project:self.controller.project)
        self.updateWith(viewModel:builder.viewModel)
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.loadFor(view:view)
        self.outlets = loader.outlets
    }
    
    private func updateWith(viewModel:ViewModel) {
        self.outlets.view?.title = viewModel.viewTitle
    }
}
