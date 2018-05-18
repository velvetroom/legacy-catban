import UIKit
import Board

protocol CanvasProtocol:class {
    var project:ProjectProtocol! { get set }
    var delegate:CanvasDelegateProtocol! { get set }
    var view:UIView { get }
    
    func refresh()
}
