import Foundation
@testable import Shared

class MockViewModelObserverProtocol:ViewModelObserverProtocol {
    var onMutated:((String) -> Void)?
    
    func mutated(viewModel:ViewModelPropertyProtocol) {
        let viewModel:MockViewModelPropertyProtocol = viewModel as! MockViewModelPropertyProtocol
        self.onMutated?(viewModel.name)
    }
}
