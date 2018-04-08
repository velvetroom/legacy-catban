import Foundation

protocol LandingDeleteProtocol {
    var onConfirm:(() -> Void)? { get set }
    var itemName:String { get set }
    var presenter:LandingDeletePresenter { get set }
}
