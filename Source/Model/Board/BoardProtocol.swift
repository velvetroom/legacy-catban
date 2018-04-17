import Foundation

protocol BoardProtocol {
    var project:ProjectProtocol { get }
    var user:UserProtocol { get set }
    var projects:[ProjectProtocol] { get set }
}
