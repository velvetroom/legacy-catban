import UIKit
import Shared

class PresenterDelete:PresenterDeleteProtocol {
    weak var delegate:PresenterDeleteDelegateProtocol?
    weak var presentingView:UIViewController?
    var itemName:String
    private var alert:UIAlertController {
        get {
            return UIAlertController(title:String.localized(key:"PresenterDelete_alert_title", in:type(of:self)),
                                     message:self.itemName, preferredStyle:UIAlertControllerStyle.actionSheet)
        }
    }
    
    private var actionConfirm:UIAlertAction {
        get {
            return UIAlertAction(title:String.localized(key:"PresenterDelete_alert_confirm", in:type(of:self)),
                                 style:UIAlertActionStyle.destructive) { (action:UIAlertAction) in self.confirmed() }
        }
    }
    
    private var actionCancel:UIAlertAction {
        get {
            return  UIAlertAction(title:String.localized(key:"PresenterDelete_alert_cancel", in:type(of:self)),
                                  style:UIAlertActionStyle.cancel)
        }
    }
    
    init() {
        self.itemName = String()
    }
    
    func askConfirmation() {
        let alert:UIAlertController = self.alert
        alert.addAction(self.actionConfirm)
        alert.addAction(self.actionCancel)
        self.prepareForIpad(alert:alert)
        self.presentingView?.present(alert, animated:true, completion:nil)
    }
    
    func confirmed() {
        self.delegate?.deleteConfirm()
    }
    
    private func prepareForIpad(alert:UIAlertController) {
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController {
            popover.sourceView = self.presentingView?.view
            popover.permittedArrowDirections = UIPopoverArrowDirection.any
            popover.sourceRect = CGRect(
                x:0,
                y:0,
                width:1,
                height:1)
        }
    }
}
