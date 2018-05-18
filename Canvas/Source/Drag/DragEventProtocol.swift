import UIKit

protocol DragEventProtocol:class {
    var view:ViewItem! { get }
    var mapItem:MapItemProtocol! { get }
    var position:DragPosition { get }
}
