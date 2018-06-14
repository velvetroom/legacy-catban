import Foundation

public extension PresenterProtocol {
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
    
    var transition:TransitionProtocol? {
        get {
            return self.presenting?.transition
        }
    }
    
    func didLoad() { }
    func willAppear() { }
    func didAppear() { }
    func orientationChanged() { }
}
