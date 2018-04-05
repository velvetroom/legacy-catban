import UIKit

extension LandingControllerAdd {
    func factoryActions() {
        self.factoryProjectAction()
        self.factoryColumnAction()
        self.factoryCardAction()
        self.factoryCancelAction()
    }
    
    private func factoryProjectAction() {
        
    }
    
    private func factoryColumnAction() {
        
    }
    
    private func factoryCardAction() {
        
    }
    
    private func factoryCancelAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingControllerAdd_actionCancelTitle"),
            style:UIAlertActionStyle.cancel, handler:nil)
        self.addAction(action)
    }
}
