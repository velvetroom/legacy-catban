import Foundation

public protocol PresenterProtocol:ViewDelegateProtocol {
    var delegate:PresenterDelegateProtocol! { get set }
    
    func presentView() -> View
}
