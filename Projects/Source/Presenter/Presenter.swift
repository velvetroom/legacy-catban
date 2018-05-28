import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Projects.View.self
    var outlets:PresenterOutlets
    weak var delegate:PresenterDelegateProtocol!
    weak var controller:Controller!
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func presenterDidLoadWith(view:Shared.View) {
        guard
            let view:View = view as? Projects.View
        else { return }
        self.configure(view:view)
        self.loadOutlets(view:view)
    }
    
    func shouldUpdate() {
        let viewModel:ViewModelProtocol = self.makeViewModel()
        self.updateWith(viewModel:viewModel)
    }
    
    private func configure(view:View) {
        view.presenter = self
    }
    
    private func loadOutlets(view:View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        loader.load()
        self.outlets = loader.outlets
    }
    
    private func makeViewModel() -> ViewModelProtocol {
        let loader:PresenterViewModelLoader = PresenterViewModelLoader()
        loader.board = self.controller.board
        loader.load()
        return loader.viewModel
    }
    
    private func updateWith(viewModel:ViewModelProtocol) {
        let updater:PresenterViewUpdater = PresenterViewUpdater()
        updater.outlets = self.outlets
        updater.viewModel = viewModel
        updater.update()
    }
}
