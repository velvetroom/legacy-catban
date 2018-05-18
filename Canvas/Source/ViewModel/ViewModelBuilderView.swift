import Foundation
import Board

class ViewModelBuilderView:ViewModelBuilderProtocol {
    var project:ProjectManagedProtocol!
    var viewModel:ViewModel!
    
    required init() { }
    
    func build() -> ViewModel {
        self.viewModel.view.title = self.project.name
        return self.viewModel
    }
}
