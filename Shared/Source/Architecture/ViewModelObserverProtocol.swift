import Foundation

protocol ViewModelObserverProtocol:class {
    func mutated<ViewModelProperty:ViewModelPropertyProtocol>(viewModel:ViewModelProperty)
}
