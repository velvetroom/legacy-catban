import UIKit
import Board
import Shared

class Canvas:CanvasProtocol, CanvasEditorProtocol {
    weak var delegate:CanvasDelegateProtocol!
    var presenter:PresenterProtocol
    
    var project:ProjectProtocol! {
        get {
            return self.presenter.project
        }
        set(newProject) {
            self.presenter.project = newProject
        }
    }
    
    var view:UIView {
        get {
            return self.presenter.view
        }
    }
    
    required init() {
        self.presenter = Presenter()
        self.presenter.canvas = self
    }
    
    func refresh() {
        self.presenter.refresh()
    }
    
    func editCardWith(identifier:String) {
        
    }
    
    func createNewCard() {
        
    }
}
