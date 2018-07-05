import Foundation
import CleanArchitecture
import Architecture
import Board

public class Presenter:PresenterProtocol {
    public weak var transition:TransitionProtocol?
    public weak var view:ViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    
    public required init() { }
    
    public func didLoad() {
        self.updateViewModel()
        self.updateViewModelProject()
    }
    
    func done() {
        self.transition?.transitionToHome(board:self.interactor.board, project:self.interactor.project)
    }
    
    func start() {
        self.interactor.start(onCompletion: { [weak self] in
            self?.updateViewModel()
        }, onError: { [weak self] (error:Error) in
            self?.updateViewModelWith(error:error)
        })
    }
    
    func save() {
        self.interactor.save(onCompletion: { [weak self] in
            self?.updateViewModelSaved()
        }) { [weak self] (error:Error) in
            self?.updateViewModelWith(error:error)
        }
    }
    
    func share() {
        let presenter:PresenterShare = PresenterShare()
        presenter.interactor = self.interactor
        let view:ViewShare = ViewShare(presenter:presenter)
        self.transition?.present(view:view)
    }
    
    func updateViewModel() {
        self.updateViewModelNavigation()
        self.updateViewModelContent()
    }
    
    private func updateViewModelSaved() {
        let project:ProjectSynchedProtocol = self.interactor.project as! ProjectSynchedProtocol
        let property:ViewModelContent = ViewModelFactory.makeContentSavedWith(project:project)
        self.viewModel.update(property:property)
    }
    
    private func updateViewModelWith(error:Error) {
        self.updateViewModelNavigationWith(error:error)
        self.updateViewModelContentWith(error:error)
    }
    
    private func updateViewModelProject() {
        let property:ViewModelProject = ViewModelFactory.makeProjectWith(project:self.interactor.project)
        self.viewModel.update(property:property)
    }
    
    private func updateViewModelNavigation() {
        let property:ViewModelNavigation = ViewModelFactory.makeNavigationWith(project:self.interactor.project)
        self.viewModel.update(property:property)
    }
    
    private func updateViewModelNavigationWith(error:Error) {
        let property:ViewModelNavigation = ViewModelFactory.makeNavigationWith(error:error)
        self.viewModel.update(property:property)
    }
    
    private func updateViewModelContent() {
        let property:ViewModelContent = ViewModelFactory.makeContentWith(project:self.interactor.project)
        self.viewModel.update(property:property)
    }
    
    private func updateViewModelContentWith(error:Error) {
        let property:ViewModelContent = ViewModelFactory.makeContentWith(error:error)
        self.viewModel.update(property:property)
    }
}
