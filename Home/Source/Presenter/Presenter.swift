import UIKit
import Board
import Shared

class Presenter:PresenterProtocol {
    weak var controller:Controller!
    var canvas:CanvasProtocol
    var outlets:PresenterOutlets
    let interactor:InteractorProtocol
    
    init() {
        self.controller = Controller()
        self.interactor = self.controller
        self.canvas = Configuration.canvasType.init()
        self.outlets = PresenterOutlets()
        self.controller.presenter = self
    }
    
    func showMenu() {
        let menu:PresenterMenu = PresenterMenu()
        menu.controller = self.controller
        menu.view = self.outlets.view
        menu.show()
    }
    
    func didLoad(view:Shared.View) {
        self.outlets.view = view
        self.loadCanvasOn(view:view.view)
    }
    
    func shouldUpdate() {
        self.updateView()
        self.updateCanvas()
    }
    
    func orientationChanged() {
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
    
    private func updateView() {
        self.outlets.view?.title = self.controller.project.name
    }
    
    private func updateCanvas() {
        self.canvas.project = self.controller.project
        self.canvas.delegate = self.controller
        self.canvas.refresh()
    }
}
