import Foundation

public protocol PresenterProtocol:ViewDelegateProtocol {
    var delegate:PresenterDelegateProtocol! { get set }
    var view:View? { get set }
}
