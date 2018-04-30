import UIKit

extension LandingDeleteController {
    func factoryActions() {
        self.factoryDeleteAction()
        self.factoryCancelAction()
    }
    
    private func factoryDeleteAction() {
        var title:String = String()
        title.append(String.localizedLanding(key:"LandingDeleteController_actionDeleteTitle"))
        title.append(self.model.itemName)
        let action:UIAlertAction = UIAlertAction(
            title:title,
            style:UIAlertActionStyle.destructive) { [weak self] (action:UIAlertAction) in
                self?.model.onConfirm?()
        }
        self.model.presenter.actionDelete = action
        self.addAction(action)
    }
    
    private func factoryCancelAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingDeleteController_actionCancelTitle"),
            style:UIAlertActionStyle.cancel, handler:nil)
        self.model.presenter.actionCancel = action
        self.addAction(action)
    }
}
