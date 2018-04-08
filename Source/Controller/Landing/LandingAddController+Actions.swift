import UIKit

extension LandingAddController {
    func factoryActions() {
        self.factoryProjectAction()
        self.factoryColumnAction()
        self.factoryCardAction()
        self.factoryCancelAction()
    }
    
    private func factoryProjectAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingAddController_actionProjectTitle"),
            style:UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
                
        }
        self.model.presenter.actionProject = action
        self.addAction(action)
    }
    
    private func factoryColumnAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingAddController_actionColumnTitle"),
            style:UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
                
        }
        self.model.presenter.actionColumn = action
        self.addAction(action)
    }
    
    private func factoryCardAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingAddController_actionCardTitle"),
            style:UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
                self?.model.delegate?.createCard()
        }
        self.model.presenter.actionCard = action
        self.addAction(action)
    }
    
    private func factoryCancelAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingAddController_actionCancelTitle"),
            style:UIAlertActionStyle.cancel, handler:nil)
        self.model.presenter.actionCancel = action
        self.addAction(action)
    }
}
