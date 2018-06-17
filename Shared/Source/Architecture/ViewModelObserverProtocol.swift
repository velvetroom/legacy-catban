import Foundation

public protocol ViewModelObserverProtocol:class {
    func mutated(viewModel:ViewModelPropertyProtocol)
}
