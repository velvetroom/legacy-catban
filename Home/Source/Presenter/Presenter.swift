import Foundation
import Shared
import Board
import Canvas

class Presenter:PresenterProtocol {
//    var viewType:Shared.View.Type = Home.View.self
    var outlets:PresenterOutlets
    var updaters:[PresenterUpdaterProtocol.Type]
    var map:MapProtocol
    var canvas:CanvasProtocol
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.canvas = CanvasFactory.makeCanvas()
        self.outlets = PresenterOutlets()
        self.map = Map()
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
            updater.map = self.map
            updater.viewModel = viewModel
            updater.update()
        }
    }
    
    func didLoad(view:Shared.View) {
        view.view.addSubview(self.canvas.view)
        self.canvas.view.topAnchor.constraint(equalTo:view.view.topAnchor).isActive = true
        self.canvas.view.bottomAnchor.constraint(equalTo:view.view.bottomAnchor).isActive = true
        self.canvas.view.leftAnchor.constraint(equalTo:view.view.leftAnchor).isActive = true
        self.canvas.view.rightAnchor.constraint(equalTo:view.view.rightAnchor).isActive = true
//        self.loadOutlets(view:view)
        self.delegate.didLoadPresenter()
    }
    
    func shouldUpdate() {
//        let builder:ViewModelBuilder = ViewModelBuilder()
//        builder.project = self.controller.project
//        self.map.clear()
//        self.updateWith(viewModel:builder.buildViewModel())
        self.canvas.project = self.controller.project
        self.canvas.refresh()
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        loader.presenter = self
        loader.loadOutlets()
    }
}
