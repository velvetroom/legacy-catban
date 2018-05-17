import UIKit

protocol MapPositionProtocol:class {
    var view:ViewBoardElement! { get set }
    var minX:CGFloat { get set }
    var minY:CGFloat { get set }
}
