import UIKit
import Board

public protocol CanvasProtocol:class {
    var project:ProjectProtocol! { get set }
    var delegate:CanvasDelegateProtocol! { get set }
    var view:UIView { get }
    
    func refresh()
}
