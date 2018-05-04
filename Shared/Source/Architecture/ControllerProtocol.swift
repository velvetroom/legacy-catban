import Foundation

public protocol ControllerProtocol:PresenterDelegateProtocol {
    var presenter:PresenterProtocol { get set }
    
    init()
}
