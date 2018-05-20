import UIKit
@testable import Canvas

class MockModelProtocol:ModelProtocol {
    var onClear:(() -> Void)?
    var onDragBegin:(() -> Void)?
    var onDragUpdate:(() -> Void)?
    var onDragEnd:(() -> Void)?
    var onAddColumns:(() -> Void)?
    var onOrderItem:(() -> Void)?
    var canvas:CanvasEditorProtocol!
    var viewItem:ViewItem!
    var mapDelegate:MapDelegateProtocol!
    var latestTouch:CGPoint
    
    init() {
        self.latestTouch = CGPoint.zero
    }
    
    func clear() {
        self.onClear?()
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
    
    func add(columns:[MapColumnProtocol]) {
        self.onAddColumns?()
    }
    
    func order(item:MapItemProtocol) {
        self.onOrderItem?()
    }
}
