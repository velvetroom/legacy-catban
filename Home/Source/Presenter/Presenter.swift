import UIKit
import CleanArchitecture
import Shared

public class Presenter:PresenterProtocol {
    public weak var view:ViewProtocol?
    public weak var transition:TransitionProtocol?
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
        self.updateMenuViewModel(show:false)
        self.transitionToMenu()
    }
    
    public func shouldUpdate() {
        self.updateMenuViewModel(show:true)
        self.canvas.refresh()
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
    
    private func updateMenuViewModel(show:Bool) {
        var viewModel:ViewModelMenu = self.viewModel.property()
        viewModel.show = show
        self.viewModel.update(property:viewModel)
    }
    
    private func transitionToMenu() {
        let presenter:PresenterMenu = PresenterMenu()
        presenter.interactor = self.interactor
        let menu:ViewMenu = ViewMenu(presenter:presenter)
        self.transition?.present(view:menu)
    }
}
