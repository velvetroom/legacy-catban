import UIKit

extension LandingEditController {
    func factoryActions() {
        self.factoryRenameAction()
        self.factoryDeleteAction()
        self.factoryCancelAction()
    }
    
    private func factoryRenameAction() {
        var title:String = String()
        title.append(String.localizedLanding(key:"LandingEditController_actionRenameTitle"))
        title.append(self.model.itemName)
        let action:UIAlertAction = UIAlertAction(
            title:title,
            style:UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
                self?.model.onRename?()
        }
        self.model.presenter.actionRename = action
        self.addAction(action)
    }
    
    private func factoryDeleteAction() {
        var title:String = String()
        title.append(String.localizedLanding(key:"LandingEditController_actionDeleteTitle"))
        title.append(self.model.itemName)
        let action:UIAlertAction = UIAlertAction(
            title:title,
            style:UIAlertActionStyle.destructive) { [weak self] (action:UIAlertAction) in
                self?.model.onDelete?()
        }
        self.model.presenter.actionDelete = action
        self.addAction(action)
    }
    
    private func factoryCancelAction() {
        let action:UIAlertAction = UIAlertAction(
            title:String.localizedLanding(key:"LandingEditController_actionCancelTitle"),
            style:UIAlertActionStyle.cancel, handler:nil)
        self.model.presenter.actionCancel = action
        self.addAction(action)
    }
}
