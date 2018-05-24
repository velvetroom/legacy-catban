import UIKit
import Shared

class View:Shared.View {
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
    
    @objc func selectorMenu(button:UIBarButtonItem) {
        
    }
}
