import UIKit

extension LandingControllerAdd {
    func factoryActions() {
        self.factoryProjectAction()
        self.factoryColumnAction()
        self.factoryCardAction()
        self.factoryCancelAction()
    }
    
    private func factoryProjectAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingControllerAdd_actionProjectTitle"),
            style:UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
                
        }
        self.addAction(action)
    }
    
    private func factoryColumnAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingControllerAdd_actionColumnTitle"),
            style:UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
                
        }
        self.addAction(action)
    }
    
    private func factoryCardAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingControllerAdd_actionCardTitle"),
            style:UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
                self?.delegate?.createCard()
        }
        self.addAction(action)
    }
    
    private func factoryCancelAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingControllerAdd_actionCancelTitle"),
            style:UIAlertActionStyle.cancel, handler:nil)
        self.addAction(action)
    }
}
