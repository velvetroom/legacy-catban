import UIKit

protocol DragProtocol:class {
    var latestTouch:CGPoint { get set }
    var viewItem:ViewItem! { get set }
    
    func dragBegin()
    func dragUpdate()
    func dragEnd()
}
