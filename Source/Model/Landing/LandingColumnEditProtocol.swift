import Foundation

protocol LandingColumnEditProtocol {
    var onRename:(() -> Void)? { get set }
    var onDelete:(() -> Void)? { get set }
    var presenter:LandingColumnEditPresenter { get set }
    var itemName:String { get set }
}
