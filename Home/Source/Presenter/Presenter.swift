import UIKit
import Board
import Shared

public class Presenter:PresenterProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Controller!
    var canvas:CanvasProtocol
    var outlets:PresenterOutlets
    
    public required init() {
        self.canvas = Configuration.canvasType.init()
        self.outlets = PresenterOutlets()
    }
    
    func showMenu() {
        let menu:PresenterMenu = PresenterMenu()
        menu.controller = self.interactor
        menu.view = self.outlets.view
        menu.show()
    }
    
    public func didLoad() {
        if let view:UIView = self.presenting?.viewController.view {
            self.loadCanvasOn(view:view)
        }
    }
    
    public func shouldUpdate() {
        self.updateView()
        self.updateCanvas()
    }
    
    public func orientationChanged() {
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
        self.outlets.view?.title = self.interactor.project.name
    }
    
    private func updateCanvas() {
        self.canvas.project = self.interactor.project
        self.canvas.delegate = self.interactor
        self.canvas.refresh()
    }
}
