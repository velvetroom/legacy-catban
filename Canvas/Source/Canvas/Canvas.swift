import UIKit
import Board
import Shared

public class Canvas:CanvasProtocol, CanvasEditorProtocol {
    public weak var delegate:CanvasDelegateProtocol!
    var presenter:PresenterProtocol
    
    public var project:ProjectProtocol! {
        get {
            return self.presenter.project
        }
        set(newProject) {
            self.presenter.project = newProject
        }
    }
    
    public var view:UIView {
        get {
            return self.presenter.view
        }
    }
    
    public required init() {
        self.presenter = Presenter()
        self.presenter.canvas = self
    }
    
    public func refresh() {
        self.presenter.refresh()
    }
    
    func editCardWith(identifier:String) {
        self.delegate.editCardWith(identifier:identifier)
    }
    
    func createNewCard() {
        self.delegate.createNewCard()
    }
}
