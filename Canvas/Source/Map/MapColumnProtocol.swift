import UIKit
import Board

protocol MapColumnProtocol:MapParentProtocol, MapBoardItemProtocol {
    var height:CGFloat { get }
    var order:OrderColumn { get }
    
    func add(item:MapItemProtocol)
    func order(item:MapItemProtocol)
}
