import UIKit

protocol DragProtocol:class {
    var lastTouch:CGPoint { get set }
    
    func dragBegin()
    func dragUpdate()
    func dragEnd()
}
