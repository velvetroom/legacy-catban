import Foundation
import Board
import Shared
import Tools

public class Presenter:PresenterProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Controller!
    var list:PresenterList
    var keyboard:PresenterForKeyboardProtocol
    var viewModel:ViewModelProtocol! {
        didSet {
            self.presenting?.viewModelUpdated()
        }
    }
    
    public required init() {
        self.list = PresenterList()
        self.keyboard = PresenterForKeyboardFactory.makePresenter()
    }
    
    public func didLoad() {
        if self.viewModel == nil {
            self.updateViewModel()
        }
    }
    
    public func shouldUpdate() {
        self.updateViewModel()
    }
    
    func addProject() {
        let project:ProjectProtocol = self.interactor.addProject()
//        self.renamer.item = ViewModelListItemFactory.makeWith(project:project)
//        self.renamer.show()
    }
    
    func openProject() {
        let identifier:String = self.list.selected.identifier
        self.interactor.openProjectWith(identifier:identifier)
    }
    
    func renameProject() {
        let view:ViewNamer = ViewNamer(presenter:self)
        self.transition?.pushTo(view:view)
        self.startEditingViewModel()
        view.viewModelUpdated()
    }
    
    func updateProject(name:String, for identifier:String) {
        self.interactor.update(project:identifier, with:name)
        self.list.selectItemWith(identifier:identifier)
    }
    
    func delete() {
        let presenter:PresenterDelete = PresenterDelete()
//        presenter.controller = self.controller
//        presenter.view = self.outlets.view
        presenter.item = self.list.selected
        presenter.askConfirmation()
    }
    
    private func updateViewModel() {
        let loader:PresenterViewModelLoader = PresenterViewModelLoader()
        loader.board = self.interactor.board
        loader.load()
        self.viewModel = loader.viewModel
        self.list.updateWith(viewModel:self.viewModel)
    }
    
    private func startEditingViewModel() {
        var viewModel:ViewModelEdit = ViewModelEdit()
        viewModel.item = self.list.selected
        self.viewModel = viewModel
    }
}
