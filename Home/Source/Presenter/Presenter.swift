import Foundation
import Shared
import Board

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    var outlets:PresenterOutlets
    var updaters:[PresenterUpdaterProtocol.Type]
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.outlets = PresenterOutlets()
        self.updaters = [
            PresenterUpdaterView.self,
            PresenterUpdaterScroll.self,
            PresenterUpdaterBoard.self,
            PresenterUpdaterColumns.self,
            PresenterUpdaterBoardItems.self]
    }
    
    func updateWith(viewModel:ViewModel) {
        for updaterType:PresenterUpdaterProtocol.Type in self.updaters {
            var updater:PresenterUpdaterProtocol = updaterType.init()
            updater.controller = self.controller
            updater.outlets = self.outlets
            updater.viewModel = viewModel
            updater.update()
        }
    }
    
    func didLoad(view:Shared.View) {
        self.loadOutlets(view:view)
        self.delegate.didLoadPresenter()
    }
    
    func shouldUpdate() {
        let builder:ViewModelBuilder = ViewModelBuilder()
        builder.project = self.controller.project
        self.updateWith(viewModel:builder.buildViewModel())
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        self.outlets = loader.loadOutlets()
    }
}
