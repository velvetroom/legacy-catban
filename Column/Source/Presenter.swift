import Foundation
import Shared
import Tools

public class Presenter:PresenterProtocol {
    public weak var view:ViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    
    public required init() { }
    
    public func didLoad() {
        self.configureViewModel()
    }
    
    public func shouldUpdate() {
        self.configureViewModel()
    }
    
    func done() {
        self.transition?.transitionToHome(project:self.interactor.project)
    }
    
    func rename() {
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.currentName = self.interactor.column.name
        viewModel.title = String.localized(key:"Presenter_Namer_Title", in:type(of:self))
        let namer:ViewProtocol = NamerFactory.makeWith(interactor:self.interactor, and:viewModel)
        self.transition?.pushTo(view:namer)
    }
    
    func delete() {
        var viewModel:DeleterViewModel = DeleterViewModel()
        viewModel.name = self.interactor.column.name
        viewModel.title = String.localized(key:"Presenter_Deleter_Title", in:type(of:self))
        let deleter:ViewProtocol = DeleterFactory.makeWith(interactor:self.interactor, and:viewModel)
        self.transition?.present(view:deleter)
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.name = self.interactor.column.name
        self.viewModel.update(property:viewModel)
    }
}
