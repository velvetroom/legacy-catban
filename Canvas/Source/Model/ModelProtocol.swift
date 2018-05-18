import Foundation

protocol ModelProtocol:DragProtocol, MapProtocol {
    var canvas:CanvasProtocol! { get set }
    
    func clear()
}
