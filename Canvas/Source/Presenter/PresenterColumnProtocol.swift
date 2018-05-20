import Foundation
import Board

protocol PresenterColumnProtocol {
    var view:View! { get set }
    var column:ColumnProtocol! { get set }
    var mapColumn:MapColumnProtocol { get }
    
    init()
    func load()
    func loadNewCard()
}
