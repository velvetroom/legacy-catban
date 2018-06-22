import UIKit
import Shared

public class View:Shared.View<Interactor, Presenter, ViewContent> {
    var notificationCenter:NotificationCenter!
    private var buttonMenu:UIBarButtonItem!
    
    public override func initProperties() {
        super.initProperties()
        self.notificationCenter = NotificationCenter.default
    }
    
    deinit {
        self.notificationCenter.removeObserver(self)
    }
    
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureCanvas()
        self.configureViewModel()
        self.listenForOrientationChange()
    }
    
    @objc func selectorMenu(button:UIBarButtonItem) {
        self.presenter.showMenu()
    }
    
    private func configureView() {
        let icon:UIImage = UIImage(name:ViewConstants.Menu.icon, in:type(of:self))
        self.buttonMenu = UIBarButtonItem(image:icon, style:UIBarButtonItemStyle.done,
                                          target:self, action:#selector(self.selectorMenu(button:)))
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
        var viewModel:ViewModelMenu = self.viewModel.property()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func configureContentViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelMenu) {
        if viewModel.show {
            self.navigationItem.rightBarButtonItem = self.buttonMenu
        } else {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    private func updated(viewModel:ViewModelContent) {
        self.title = viewModel.title
    }
    
    private func listenForOrientationChange() {
        self.notificationCenter.addObserver(
            forName:Notification.Name.UIDeviceOrientationDidChange, object:nil,
            queue:OperationQueue.main) { [weak self] (notification:Notification) in
                self?.presenter.orientationChanged()
        }
    }
}
