import UIKit

protocol DragProtocol:class {
    var controller:CanvasProtocol! { get set }
    var map:MapProtocol! { get set }
    var position:DragPosition { get set }
    var view:ViewItem! { get }
    var mapItem:MapItemProtocol! { get }
    
    func beginWith(view:ViewItem, and touch:CGPoint)
    func update()
    func end()
}
