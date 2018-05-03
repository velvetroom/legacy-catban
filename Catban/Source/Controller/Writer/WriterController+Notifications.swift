import UIKit

extension WriterController {
    private var layoutBarBottom:NSLayoutConstraint? {
        get {
            return self.model.presenter.outlets.list.layoutBarBottom
        }
    }
    
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(self.notifiedKeyboardChanged(sender:)),
            name:NSNotification.Name.UIKeyboardWillChangeFrame, object:nil)
    }
    
    func keyboardChanged(notification:Notification) {
        let keyboardHeight:CGFloat = self.keyboardHeightFrom(notification:notification)
        let animationDuration:TimeInterval = self.animationDurationFrom(notification:notification)
        self.layoutBarBottom?.constant = keyboardHeight
        UIView.animate(withDuration:animationDuration) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    func keyboardHeightFrom(notification:Notification) -> CGFloat {
        let rect:CGRect = self.keyboardRectFrom(notification:notification)
        let height:CGFloat = self.view.bounds.height
        if rect.minY < height {
            return -(height - rect.minY)
        }
        return 0
    }
    
    func keyboardRectFrom(notification:Notification) -> CGRect {
        guard
            let userInfo:[AnyHashable:Any] = notification.userInfo,
            let frameValue:NSValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
        else { return CGRect.zero }
        return frameValue.cgRectValue
    }
    
    func animationDurationFrom(notification:Notification) -> TimeInterval {
        guard
            let userInfo:[AnyHashable:Any] = notification.userInfo,
            let animationDuration:NSNumber = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
        else { return 0 }
        return animationDuration.doubleValue
    }
}
