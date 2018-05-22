import Foundation
import Board

protocol MapNestableColumnProtocol:MapColumnProtocol, MapParentProtocol {
    var order:OrderColumn { get }
    
    func add(item:MapItemProtocol)
    func arrange(item:MapItemProtocol)
}
