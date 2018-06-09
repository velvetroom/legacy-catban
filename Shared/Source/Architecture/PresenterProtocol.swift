import Foundation

public protocol PresenterProtocol:class {
    var interactor:InteractorProtocol { get }
    
    func shouldUpdate()
}
