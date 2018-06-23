import UIKit
import Board
import Shared

class MockCanvasProtocol:CanvasProtocol {
    var onRefresh:(() -> Void)?
    var project:ProjectProtocol!
    var delegate:CanvasDelegateProtocol!
    var view:UIView
    
    required init() {
        self.view = UIView()
    }
    
    func refresh() {
        self.onRefresh?()
    }
}
