import UIKit

protocol DragEventProtocol:class {
    var position:DragPosition { get }
    var viewItem:ViewItem! { get }
    var mapItem:MapItemProtocol! { get }
    var canvas:CanvasEditorProtocol! { get }
}
