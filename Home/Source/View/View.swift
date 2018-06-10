import UIKit
import Shared

public class View:Shared.View<Controller, Presenter, UIView> {
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureNavigationItem()
        self.listenForOrientationChange()
    }
    
    public override func dismiss(animated:Bool, completion:(() -> Void)? = nil) {
        super.dismiss(animated:animated) { [weak self] in
            self?.configureNavigationItem()
        }
    }
    
    @objc func selectorMenu(button:UIBarButtonItem) {
        self.navigationItem.rightBarButtonItem = nil
//        self.presenter?.showMenu()
    }
    
    private func configureView() {
        self.content.backgroundColor = UIColor.white
    }
    
    private func configureNavigationItem() {
        let icon:UIImage = UIImage(name:ViewConstants.Menu.icon, in:type(of:self))
        let buttonMenu:UIBarButtonItem = UIBarButtonItem(image:icon, style:UIBarButtonItemStyle.done,
                                                         target:self, action:#selector(self.selectorMenu(button:)))
        self.navigationItem.rightBarButtonItem = buttonMenu
    }
    
    private func listenForOrientationChange() {
        NotificationCenter.default.addObserver(forName:Notification.Name.UIDeviceOrientationDidChange, object:nil, queue:OperationQueue.main) { [weak self] (notification:Notification) in
//            self?.delegate.orientationChanged()
        }
    }
}
