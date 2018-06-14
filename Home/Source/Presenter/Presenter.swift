import UIKit
import Board
import Shared

public class Presenter:PresenterProtocol {
    public typealias ViewModel = Home.ViewModel
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    var canvas:CanvasProtocol
    
    public required init() {
        self.canvas = Configuration.canvasType.init()
    }
    
    func showMenu() {
        let menu:PresenterMenu = PresenterMenu()
        menu.interactor = self.interactor
//        menu.view = self.presenting
        menu.show()
    }
    
    public func didLoad() {
        if let view:UIView = self.presenting?.viewController.view {
            self.loadCanvasOn(view:view)
        }
    }
    
    public func shouldUpdate() {
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
    
    private func updateCanvas() {
        self.canvas.project = self.interactor.project
        self.canvas.delegate = self.interactor
        self.canvas.refresh()
    }
}
