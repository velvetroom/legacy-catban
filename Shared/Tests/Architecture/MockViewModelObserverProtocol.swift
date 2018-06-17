import Foundation
@testable import Shared

class MockViewModelObserverProtocol:ViewModelObserverProtocol {
    var onMutated:((String) -> Void)?
    
    func mutated(viewModel:MockViewModelPropertyProtocol) {
        self.onMutated?(viewModel.name)
    }
}
