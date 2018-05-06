import Foundation

public protocol PresenterProtocol:ViewDelegateProtocol {
    var viewType:View.Type { get }
    var view:View { get }
    var delegate:PresenterDelegateProtocol? { get set }
}
