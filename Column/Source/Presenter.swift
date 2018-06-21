import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    
    public required init() { }
    
    public func didLoad() {
        self.configureViewModel()
    }
    
    func done() {
        
    }
    
    func rename() {
        
    }
    
    func delete() {
        
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.name = self.interactor.column.name
        self.viewModel.update(property:viewModel)
    }
}
