import Foundation

public protocol PresenterProtocol:class, ViewDelegateProtocol {
    var interactor:InteractorProtocol { get }
    
    func shouldUpdate()
}
