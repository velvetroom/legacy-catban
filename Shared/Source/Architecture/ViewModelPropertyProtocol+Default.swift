import Foundation

public extension ViewModelPropertyProtocol {
    func notifyObserver() {
        self.observer?.mutated(viewModel:self)
    }
}
