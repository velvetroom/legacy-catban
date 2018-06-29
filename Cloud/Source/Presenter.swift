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
        self.updateViewModelContent()
    }
    
    private func updateViewModelContent() {
        var viewModel:ViewModelProject = self.viewModel.property()
        viewModel.projectName = self.interactor.project.name
        self.viewModel.update(property:viewModel)
    }
}
