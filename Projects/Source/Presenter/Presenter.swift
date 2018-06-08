import Foundation
import Board
import Shared
import Tools

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Projects.View.self
    var deleteType:PresenterDelete.Type
    var outlets:PresenterOutlets
    var list:PresenterList
    var renamer:PresenterRenamer
    var presenterForKeyboard:PresenterForKeyboardProtocol
    weak var delegate:PresenterDelegateProtocol!
    weak var controller:Controller!
    
    init() {
        self.outlets = PresenterOutlets()
        self.list = PresenterList()
        self.renamer = PresenterRenamer()
        self.presenterForKeyboard = PresenterForKeyboardFactory.makePresenter()
        self.deleteType = PresenterDelete.self
    }
    
    func presenterDidLoadWith(view:Shared.View) {
        guard
            let view:View = view as? Projects.View
        else { return }
        self.configure(view:view)
        self.loadOutlets(view:view)
        self.injectDelegates(view:view)
    }
    
    func shouldUpdate() {
        let viewModel:ViewModelProtocol = self.makeViewModel()
        self.updateWith(viewModel:viewModel)
    }
    
    func addProject() {
        let project:ProjectProtocol = self.controller.addProject()
        self.renamer.item = ViewModelListItemFactory.makeWith(project:project)
        self.renamer.show()
    }
    
    func openProject() {
        let identifier:String = self.list.selected.identifier
        self.controller.openProjectWith(identifier:identifier)
    }
    
    func renameProject() {
        self.controller.renameProjectWith(identifier:self.list.selected.identifier)
    }
    
    func updateProject(name:String) {
        self.renamer.hide()
        let identifier:String = self.renamer.item.identifier
        self.controller.update(project:identifier, with:name)
        self.list.selectItemWith(identifier:identifier)
    }
    
    func delete() {
        let presenter:PresenterDelete = self.deleteType.init()
        presenter.controller = self.controller
        presenter.view = self.outlets.view
        presenter.item = self.list.selected
        presenter.askConfirmation()
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
    
    private func injectDelegates(view:View) {
        let delegater:PresenterDelegater = PresenterDelegater()
        delegater.presenter = self
        delegater.inject()
    }
    
    private func makeViewModel() -> ViewModelProtocol {
        let loader:PresenterViewModelLoader = PresenterViewModelLoader()
        loader.board = self.controller.board
        loader.load()
        return loader.viewModel
    }
    
    private func updateWith(viewModel:ViewModelProtocol) {
        let updater:PresenterViewUpdater = PresenterViewUpdater()
        updater.presenter = self
        updater.viewModel = viewModel
        updater.update()
    }
}
