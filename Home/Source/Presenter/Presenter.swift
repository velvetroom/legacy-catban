import UIKit
import Shared
import Board

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    var outlets:PresenterOutlets
    var updaters:[PresenterUpdaterProtocol.Type]
    var drag:Map
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.outlets = PresenterOutlets()
        self.drag = Map()
        self.updaters = [
            PresenterUpdaterView.self,
            PresenterUpdaterScroll.self,
            PresenterUpdaterBoard.self,
            PresenterUpdaterColumns.self]
    }
    
    func updateWith(viewModel:ViewModel) {
        for updaterType:PresenterUpdaterProtocol.Type in self.updaters {
            var updater:PresenterUpdaterProtocol = updaterType.init()
            updater.outlets = self.outlets
            updater.drag = self.drag
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
        self.drag = Map()
        self.updateWith(viewModel:builder.buildViewModel())
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        loader.presenter = self
        loader.loadOutlets()
    }
}
