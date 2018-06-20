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
    
    public func didLoad() {
        self.configureCanvas()
        self.configureViewModel()
    }
    
    func showMenu() {
        let presenter:PresenterMenu = PresenterMenu()
        presenter.interactor = self.interactor
        let menu:ViewMenu = ViewMenu(presenter:presenter)
        self.transition?.present(view:menu)
    }
    
    private func configureCanvas() {
        self.canvas.project = self.interactor.project
        self.canvas.delegate = self.interactor
        self.canvas.refresh()
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.title = self.interactor.project.name
        self.viewModel.update(property:viewModel)
    }
}
