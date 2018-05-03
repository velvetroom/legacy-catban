import Foundation

public protocol PresenterProtocol:ViewDelegateProtocol {
    var controller:ControllerProtocol { get set }
    var view:View { get set }
}
