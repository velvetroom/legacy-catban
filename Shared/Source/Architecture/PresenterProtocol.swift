import Foundation

public protocol PresenterProtocol:ViewDelegateProtocol {
    var delegate:PresenterDelegateProtocol! { get set }
    var viewType:View.Type { get }
    var view:View { get }
}
