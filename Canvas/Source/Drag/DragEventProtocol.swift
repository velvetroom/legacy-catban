import Foundation

protocol DragEventProtocol:class {
    var position:DragPosition { get }
    var viewItem:ViewItem! { get }
    var canvas:CanvasEditorProtocol! { get }
}
