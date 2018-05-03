import Foundation

public protocol PresenterProtocol:ViewDelegateProtocol {
    var view:View { get set }
}
