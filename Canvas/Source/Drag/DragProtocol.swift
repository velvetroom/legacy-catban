import UIKit

protocol DragProtocol:class {
    var map:MapProtocol! { get set }
    var controller:Controller! { get set }
    var position:DragPosition { get set }
    var view:ViewBoardItem! { get }
    var mapItem:MapItemProtocol! { get }
    
    func beginWith(view:ViewBoardItem, and touch:CGPoint)
    func update()
    func end()
}
