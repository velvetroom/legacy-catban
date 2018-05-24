import UIKit
import Board

class PresenterDelete {
    weak var view:View!
    weak var controller:Controller!
    
    required init() { }
    
    func askConfirmation() {
        let alert:UIAlertController = self.factoryAlert()
        alert.addAction(self.factoryConfirmAction())
        alert.addAction(self.factoryCancelAction())
        self.view.present(alert, animated:true, completion:nil)
    }
    
    func confirmed() {
        self.view.showNavigationBar()
        self.controller.delete()
    }
    
    private func factoryAlert() -> UIAlertController {
        let alert:UIAlertController = UIAlertController(title:
            String.localized(key:"PresenterDelete_alert_title", in:type(of:self)), message:nil, preferredStyle:UIAlertControllerStyle.actionSheet)
        self.prepareForIpad(alert:alert)
        return alert
    }
    
    private func prepareForIpad(alert:UIAlertController) {
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController {
            popover.sourceView = view.view
            popover.permittedArrowDirections = UIPopoverArrowDirection.any
            popover.sourceRect = CGRect(
                x:0,
                y:0,
                width:1,
                height:1)
        }
    }
    
    private func factoryConfirmAction() -> UIAlertAction {
        let action:UIAlertAction = UIAlertAction(
            title:String.localized(key:"PresenterDelete_alert_confirm", in:type(of:self)),
            style:UIAlertActionStyle.destructive) { (action:UIAlertAction) in
                self.confirmed()
        }
        return action
    }
    
    private func factoryCancelAction() -> UIAlertAction {
        let action:UIAlertAction = UIAlertAction(
            title:String.localized(key:"PresenterDelete_alert_cancel", in:type(of:self)),
            style:UIAlertActionStyle.cancel)
        return action
    }
}
