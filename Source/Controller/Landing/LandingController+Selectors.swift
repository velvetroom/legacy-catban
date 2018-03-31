import UIKit

extension LandingController {
    @objc func selectorAdd(sender button:UIButton) {
        
    }
    
    @objc func selectorEdit(sender button:UIButton) {
        
    }
    
    @objc func selectorCloseEditingCard(sender button:UIButton) {
        self.model.presenter.outlets.list.viewCollection?.clearSelection()
        self.model.update(editingCard:nil)
    }
}
