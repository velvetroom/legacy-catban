import UIKit
import Board
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    var canvas:CanvasProtocol
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    weak var view:Shared.View?
    
    init() {
        self.canvas = Configuration.canvasType.init()
    }
    
    func didLoad(view:Shared.View) {
        self.view = view
        self.loadCanvasOn(view:view.view)
        self.delegate.didLoadPresenter()
    }
    
    func shouldUpdate() {
        let project:ProjectManagedProtocol = self.controller.project
        self.view?.title = project.name
        self.canvas.project = project
        self.canvas.refresh()
    }
    
    private func loadCanvasOn(view:UIView) {
        let canvas:UIView = self.canvas.view
        view.addSubview(canvas)
        canvas.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        canvas.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        canvas.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
    }
}
