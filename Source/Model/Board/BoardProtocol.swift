import Foundation

protocol BoardProtocol {
    var user:UserProtocol { get set }
    var projects:[ProjectProtocol] { get set }
}
