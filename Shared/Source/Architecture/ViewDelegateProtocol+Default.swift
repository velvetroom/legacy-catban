import Foundation

public extension ViewDelegateProtocol {
    var viewModel:ViewModel {
        get {
            guard
                let viewModel:ViewModel = self.presenting?.presentingViewModel as? Self.ViewModel
            else { return ViewModel() }
            return viewModel
        }
        
        set(newValue) {
            self.presenting?.presentingViewModel = viewModel
        }
    }
}
