import Foundation

protocol ErrorProtocol {
    var message:String { get set }
    var presenter:ErrorPresenter { get set }
}
