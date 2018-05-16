import UIKit

protocol DragItemProtocol:class {
    var parent:DragParentProtocol! { get set }
    var view:ViewBoardItem! { get set }
    var minX:CGFloat { get }
    var minY:CGFloat { get }
    var midX:CGFloat { get }
    var midY:CGFloat { get }
    var maxX:CGFloat { get }
    var maxY:CGFloat { get }
}
