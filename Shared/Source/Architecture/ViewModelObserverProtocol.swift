import Foundation

public protocol ViewModelObserverProtocol:class {
    associatedtype Property:ViewModelPropertyProtocol
    
    func mutated(viewModel:Property)
}
