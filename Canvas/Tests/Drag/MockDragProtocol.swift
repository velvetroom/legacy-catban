import UIKit
@testable import Canvas

class MockDragProtocol:DragProtocol {
    var onDragBegin:(() -> Void)?
    var onDragUpdate:(() -> Void)?
    var onDragEnd:(() -> Void)?
    var latestTouch:CGPoint
    var viewItem:ViewItem!
    
    init() {
        self.latestTouch = CGPoint.zero
    }
    
    func dragBegin() {
        self.onDragBegin?()
    }
    
    func dragUpdate() {
        self.onDragUpdate?()
    }
    
    func dragEnd() {
        self.onDragEnd?()
    }
}
