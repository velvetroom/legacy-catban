import Foundation
import Board
import Shared
import Tools

public class Presenter:PresenterProtocol, PresenterDeleteDelegateProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
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
        self.updateViewModel()
    }
    
    public func shouldUpdate() {
        self.updateViewModel()
    }
    
    func addProject() {
        let project:ProjectProtocol = self.interactor.addProject()
        var item:ViewModelListItem = ViewModelListItem()
        item.identifier = project.identifier
        self.startEditingWith(item:item)
        self.showNamer()
    }
    
    func openProject() {
        let identifier:String = self.list.selected.identifier
        self.interactor.openProjectWith(identifier:identifier)
    }
    
    func renameProject() {
        self.startEditingWithListItem()
        self.showNamer()
    }
    
    func updateProject(name:String, for identifier:String) {
        self.interactor.update(project:identifier, with:name)
        self.list.selectItemWith(identifier:identifier)
    }
    
    func delete() {
        var presenter:PresenterDeleteProtocol = PresenterDeleteFactory.makePresenter()
        presenter.delegate = self
        presenter.presentingView = self.presenting
        presenter.itemName = self.list.selected.name
        presenter.askConfirmation()
    }
    
    public func deleteConfirm() {
        self.interactor.deleteProjectWith(identifier:self.list.selected.identifier)
    }
    
    private func updateViewModel() {
        let loader:ViewModelLoader = ViewModelLoader()
        loader.board = self.interactor.board
        loader.load()
        self.viewModel = loader.viewModel
        self.list.updateWith(viewModel:self.viewModel)
    }
    
    private func startEditingWithListItem() {
        self.startEditingWith(item:self.list.selected)
    }
    
    private func startEditingWith(item:ViewModelListItem) {
        var viewModel:ViewModelEdit = ViewModelEdit()
        viewModel.item = item
        self.viewModel = viewModel
    }
    
    private func showNamer() {
        var viewModel:NamerViewModel = NamerViewModel()
        let view:PresentingViewProtocol = NamerFactory.makeNamerWith(interactor:self.interactor, and:viewModel)
        self.transition?.pushTo(view:view)
        view.viewModelUpdated()
    }
}
