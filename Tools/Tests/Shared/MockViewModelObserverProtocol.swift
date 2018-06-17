import Foundation
import Shared

class MockViewModelObserverProtocol:ViewModelObserverProtocol {
    var onMutated:((ViewModelPropertyProtocol) -> Void)?
    
    func mutated(viewModel:ViewModelPropertyProtocol) {
        self.onMutated?(viewModel)
    }
}
