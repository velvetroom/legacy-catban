import UIKit
import Board

class ViewModelBuilder {
    weak var project:ProjectManagedProtocol!
    var builders:[ViewModelBuilderProtocol.Type]
    var viewModel:ViewModel
    
    init() {
        self.viewModel = ViewModel()
        self.builders = [
            ViewModelBuilderView.self,
            ViewModelBuilderColumns.self]
    }
    
    func buildViewModel() -> ViewModel {
        for builderType:ViewModelBuilderProtocol.Type in self.builders {
            var builder:ViewModelBuilderProtocol = builderType.init()
            builder.viewModel = self.viewModel
            builder.project = self.project
            self.viewModel = builder.build()
        }
        return self.viewModel
    }
}
