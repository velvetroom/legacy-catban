import UIKit
import Shared

public class View:Shared.View<Interactor, Presenter, ViewContent> {
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureCanvas()
        self.configureViewModel()
        self.listenForOrientationChange()
    }
    
    public override func dismiss(animated:Bool, completion:(() -> Void)? = nil) {
        super.dismiss(animated:animated) { [weak self] in
            var viewModel:ViewModelMenu = ViewModelMenu()
            viewModel.hidden = false
            self?.viewModel.update(property:viewModel)
        }
    }
    
    @objc func selectorMenu(button:UIBarButtonItem) {
        self.navigationItem.rightBarButtonItem = nil
//        self.presenter?.showMenu()
    }
    
    private func configureView() {
        let icon:UIImage = UIImage(name:ViewConstants.Menu.icon, in:type(of:self))
        let buttonMenu:UIBarButtonItem = UIBarButtonItem(image:icon, style:UIBarButtonItemStyle.done,
                                                         target:self, action:#selector(self.selectorMenu(button:)))
        self.navigationItem.rightBarButtonItem = buttonMenu
    }
    
    private func configureCanvas() {
        let viewCanvas:UIView = self.presenter.canvas.view
        self.content.viewCanvas = viewCanvas
        self.content.addSubview(viewCanvas)
        self.content.layoutCanvas()
    }
    
    private func configureViewModel() {
        self.configureMenuViewModel()
        self.configureContentViewModel()
    }
    
    private func configureMenuViewModel() {
        var viewModel:ViewModelMenu = ViewModelMenu()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func configureContentViewModel() {
        var viewModel:ViewModelContent = ViewModelContent()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelMenu) {
        self.navigationItem.rightBarButtonItem?.customView?.isHidden = viewModel.hidden
    }
    
    private func updated(viewModel:ViewModelContent) {
        self.title = viewModel.title
    }
    
    private func listenForOrientationChange() {
        NotificationCenter.default.addObserver(forName:Notification.Name.UIDeviceOrientationDidChange, object:nil, queue:OperationQueue.main) { [weak self] (notification:Notification) in
            self?.presenter.orientationChanged()
        }
    }
}
