import UIKit
import Board
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    var canvas:CanvasProtocol
    var outlets:PresenterOutlets
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.canvas = Configuration.canvasType.init()
        self.outlets = PresenterOutlets()
    }
    
    func presenterDidLoadWith(view:Shared.View) {
        self.outlets.view = view
        self.loadCanvasOn(view:view.view)
    }
    
    func shouldUpdate() {
        self.updateView()
        self.updateCanvas()
    }
    
    private func loadCanvasOn(view:UIView) {
        let canvas:UIView = self.canvas.view
        view.addSubview(canvas)
        canvas.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        canvas.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        canvas.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
    }
    
    private func updateView() {
        self.outlets.view?.title = self.controller.project.name
    }
    
    private func updateCanvas() {
        self.canvas.project = self.controller.project
        self.canvas.delegate = self.controller
        self.canvas.refresh()
    }
}
