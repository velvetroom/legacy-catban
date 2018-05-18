import UIKit
import Board

class Canvas:CanvasProtocol {
    weak var project:ProjectProtocol!
    weak var delegate:CanvasDelegateProtocol!
    var presenter:PresenterProtocol
    var view:UIView {
        get {
            return self.presenter.view
        }
    }
    
    init() {
        self.presenter = Presenter()
    }
    
    func refresh() {
        
    }
}
