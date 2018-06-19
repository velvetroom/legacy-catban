import UIKit
import Shared

public class Presenter:PresenterProtocol {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    var canvas:CanvasProtocol
    
    public required init() {
        self.canvas = Configuration.canvasType.init()
    }
    
    public func orientationChanged() {
        self.canvas.refresh()
    }
    
    func showMenu() {
//        let menu:PresenterMenu = PresenterMenu()
//        menu.interactor = self.interactor
//        menu.view = self.presenting
//        menu.show()
    }
    
    public func didLoad() {
        self.canvas.project = self.interactor.project
        self.canvas.delegate = self.interactor
        self.canvas.refresh()
    }
}
