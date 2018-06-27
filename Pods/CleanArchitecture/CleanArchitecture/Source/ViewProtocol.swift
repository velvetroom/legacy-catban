import Foundation

public protocol ViewProtocol:class {
    var interactor:InteractorProtocol { get }
    var viewModel:ViewModel { get }
    
    init()
}
