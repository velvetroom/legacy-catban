import UIKit
import Shared

class View:Shared.View {
    weak var presenter:Presenter?
    
    override func didLoad() {
        super.didLoad()
        self.configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        let icon:UIImage = UIImage(name:ViewConstants.Menu.icon, in:type(of:self))
        let buttonMenu:UIBarButtonItem = UIBarButtonItem(image:icon, style:UIBarButtonItemStyle.done,
                                                         target:self, action:#selector(self.selectorMenu(button:)))
        self.navigationItem.rightBarButtonItem = buttonMenu
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
}
