import Foundation

public extension ViewDelegateProtocol {
    var viewModel:ViewModel? {
        get {
            return self.presenting?.presentingViewModel as? Self.ViewModel
        }
        
        set(newValue) {
            if let viewModel:ViewModel = newValue {
                self.presenting?.presentingViewModel = viewModel
            }
        }
    }
}
