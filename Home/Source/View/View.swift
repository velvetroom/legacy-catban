import UIKit
import Shared

class View:Shared.View {
    override func didLoad() {
        super.didLoad()
        self.configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        let buttonMore:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.add,
                                                         target:self,
                                                         action:#selector(self.selectorDone(sender:)))
        self.navigationItem.rightBarButtonItems = [buttonMore]
    }
    
    @objc func selectorDone(sender button:UIBarButtonItem) {
        
    }
}
