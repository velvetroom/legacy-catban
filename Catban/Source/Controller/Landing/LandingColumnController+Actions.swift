import UIKit

extension LandingColumnController {
    func factoryActions() {
        self.factoryRenameAction()
        self.factoryDeleteAction()
        self.factoryCancelAction()
    }
    
    private func factoryRenameAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingColumnEditController_actionRenameTitle"),
            style:UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
                self?.model.onRename?()
        }
        self.model.presenter.actionRename = action
        self.addAction(action)
    }
    
    private func factoryDeleteAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingColumnEditController_actionDeleteTitle"),
            style:UIAlertActionStyle.destructive) { [weak self] (action:UIAlertAction) in
                self?.model.onDelete?()
        }
        self.model.presenter.actionDelete = action
        self.addAction(action)
    }
    
    private func factoryCancelAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingColumnEditController_actionCancelTitle"),
            style:UIAlertActionStyle.cancel, handler:nil)
        self.model.presenter.actionCancel = action
        self.addAction(action)
    }
}
