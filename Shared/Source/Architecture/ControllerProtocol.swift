import Foundation

public protocol ControllerProtocol:PresenterDelegateProtocol {
    var presenter:PresenterProtocol { get set }
    var transiton:TransitionProtocol! { get set }
    
    init()
}
