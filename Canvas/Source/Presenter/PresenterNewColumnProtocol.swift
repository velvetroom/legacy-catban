import Foundation
import Board

protocol PresenterNewColumnProtocol {
    var view:View! { get set }
    var mapColumn:MapColumnProtocol { get }
    
    init()
    func load()
}
