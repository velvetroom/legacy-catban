import UIKit
import Shared

class View:Shared.View {
    weak var presenter:Presenter?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didLoad() {
        super.didLoad()
        self.configureNavigationItem()
        NotificationCenter.default.addObserver(forName:Notification.Name.UIDeviceOrientationDidChange, object:nil, queue:OperationQueue.main) { [weak self] (notification:Notification) in
            self?.presenter?.updateConstraints()
        }
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated:true)
    }
    
    override func dismiss(animated:Bool, completion:(() -> Void)? = nil) {
        super.dismiss(animated:animated) { [weak self] in
            self?.configureNavigationItem()
        }
    }
    
    @objc func selectorMenu(button:UIBarButtonItem) {
        self.navigationItem.rightBarButtonItem = nil
        self.presenter?.showMenu()
    }
    
    private func configureNavigationItem() {
        let icon:UIImage = UIImage(name:ViewConstants.Menu.icon, in:type(of:self))
        let buttonMenu:UIBarButtonItem = UIBarButtonItem(image:icon, style:UIBarButtonItemStyle.done,
                                                         target:self, action:#selector(self.selectorMenu(button:)))
        self.navigationItem.rightBarButtonItem = buttonMenu
    }
}
