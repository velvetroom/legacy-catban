import UIKit

extension LandingController {
    @objc func selectorAdd(sender button:UIButton) {
        
    }
    
    @objc func selectorEdit(sender button:UIButton) {
        
    }
    
    @objc func selectorCloseEditingCard(sender button:UIButton) {
        self.presenter.outlets.list.viewCollection?.clearSelection()
        self.reloadViewModelWith(editingCard:nil)
    }
}
