import UIKit

class PresenterRenamer:NSObject, UITextFieldDelegate {
    weak var viewRenamer:ViewRenamer!
    
    override init() {
        super.init()
        self.registerForNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self,selector:#selector(self.notifiedKeyboardChanged(notification:)),
                                               name:NSNotification.Name.UIKeyboardWillChangeFrame, object:nil)
    }
    
    @objc private func notifiedKeyboardChanged(notification:Notification) {
        let keyboardHeight:CGFloat = self.keyboardHeightFrom(notification:notification)
        let duration:TimeInterval = self.animationDurationFrom(notification:notification)
        self.animateText(keyboardHeight:keyboardHeight, duration:duration)
    }
    
    private func keyboardHeightFrom(notification:Notification) -> CGFloat {
        let rect:CGRect = self.keyboardRectFrom(notification:notification)
        let height:CGFloat = self.viewRenamer.bounds.height
        if rect.minY < height {
            return -(height - rect.minY)
        }
        return 0
    }
    
    private func keyboardRectFrom(notification:Notification) -> CGRect {
        guard
            let userInfo:[AnyHashable:Any] = notification.userInfo,
            let frameValue:NSValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
        else { return CGRect.zero }
        return frameValue.cgRectValue
    }
    
    private func animationDurationFrom(notification:Notification) -> TimeInterval {
        guard
            let userInfo:[AnyHashable:Any] = notification.userInfo,
            let duration:NSNumber = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
        else { return 0 }
        return duration.doubleValue
    }
    
    private func animateText(keyboardHeight:CGFloat, duration:TimeInterval) {
        self.viewRenamer.layoutBottom.constant = keyboardHeight
        UIView.animate(withDuration:duration) { [weak self] in
            self?.viewRenamer.layoutIfNeeded()
        }
    }
}
