import Foundation

protocol ModelProtocol:DragProtocol, MapProtocol {
    var canvas:CanvasEditorProtocol! { get set }
    
    func clear()
}
