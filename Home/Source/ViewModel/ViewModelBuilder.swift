import Foundation
import Board

class ViewModelBuilder {
    var viewModel:ViewModel
    
    init() {
        self.viewModel = ViewModel()
    }
    
    func buildWith(project:ProjectManagedProtocol) {
        self.viewModel.viewTitle = project.name
    }
}
