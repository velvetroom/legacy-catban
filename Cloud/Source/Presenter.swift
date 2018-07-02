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
    }
    
    func done() {
        self.transition?.transitionToHome(board:self.interactor.board, project:self.interactor.project)
    }
    
    private func updateViewModel() {
        self.updateViewModelNavigation()
        self.updateViewModelProject()
        self.updateViewModelContent()
    }
    
    private func updateViewModelNavigation() {
        let property:ViewModelNavigation = ViewModelFactory.makeNavigationWith(project:self.interactor.project)
        self.viewModel.update(property:property)
    }
    
    private func updateViewModelProject() {
        let property:ViewModelProject = ViewModelFactory.makeProjectWith(project:self.interactor.project)
        self.viewModel.update(property:property)
    }
    
    private func updateViewModelContent() {
        let property:ViewModelContent = ViewModelFactory.makeContentWith(project:self.interactor.project)
        self.viewModel.update(property:property)
    }
}
