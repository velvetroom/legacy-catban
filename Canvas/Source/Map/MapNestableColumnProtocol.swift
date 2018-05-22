import Foundation
import Board

protocol MapNestableColumnProtocol:MapColumnProtocol, MapParentProtocol, MapBoardItemProtocol {
    var order:OrderColumn { get }
    
    func add(item:MapItemProtocol)
    func arrange(item:MapItemProtocol)
}
