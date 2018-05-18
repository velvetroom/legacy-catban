import UIKit
import Board

class Canvas:CanvasProtocol {
    weak var project:ProjectProtocol!
    weak var delegate:CanvasDelegateProtocol!
    var view:UIView
    
    init() {
        self.view = View()
    }
    
    func refresh() {
        
    }
}
