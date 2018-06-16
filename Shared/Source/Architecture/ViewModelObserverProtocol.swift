import Foundation

public protocol ViewModelObserverProtocol:class {
    func mutated<ViewModelProperty:ViewModelPropertyProtocol>(viewModel:ViewModelProperty)
}
