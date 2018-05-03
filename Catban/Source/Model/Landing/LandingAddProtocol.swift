import Foundation

protocol LandingAddProtocol {
    var delegate:LandingAddControllerDelegateProtocol? { get set }
    var presenter:LandingAddPresenter { get set }
}
