import UIKit

protocol MapNodeProtocol:class {
    var view:ViewItem! { get set }
    var minX:CGFloat { get set }
    var minY:CGFloat { get set }
    var midX:CGFloat { get }
    var midY:CGFloat { get }
    var maxX:CGFloat { get }
    var maxY:CGFloat { get }
}
