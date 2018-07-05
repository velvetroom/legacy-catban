import Foundation
import CleanArchitecture
import Architecture

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
        
    }
    
    func updateViewModel() {
        self.updateViewModelNavigation()
        self.updateViewModelContent()
    }
    
    private func updateViewModelSaved() {
        let property:ViewModelContent = ViewModelFactory.makeContentSaved()
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
