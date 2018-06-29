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
    
    private func updateViewModel() {
        self.updateViewModelContent()
    }
    
    private func updateViewModelContent() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.projectName = self.interactor.project.name
        self.viewModel.update(property:viewModel)
    }
}
