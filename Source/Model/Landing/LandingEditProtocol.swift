import Foundation

protocol LandingEditProtocol {
    var onRename:(() -> Void)? { get set }
    var onDelete:(() -> Void)? { get set }
    var presenter:LandingEditPresenter { get set }
    var itemName:String { get set }
}
