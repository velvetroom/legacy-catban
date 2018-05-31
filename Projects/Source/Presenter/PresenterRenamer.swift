import UIKit

class PresenterRenamer {
    weak var view:ViewRenamer!
    var item:ViewModelListItem!
    
    init() {
        self.registerForNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func showRenamer() {
        self.view.isUserInteractionEnabled = true
        self.animateView(alpha:ViewConstants.Renamer.alphaOn)
        self.view.viewInput.viewField.text = self.item.name
        self.view.viewInput.viewField.becomeFirstResponder()
    }
    
    func hideRenamer() {
        self.view.isUserInteractionEnabled = false
        self.animateView(alpha:ViewConstants.Renamer.alphaOff)
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
        let height:CGFloat = self.view.bounds.height
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
        self.view.layoutBottom.constant = keyboardHeight
        UIView.animate(withDuration:duration) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    private func animateView(alpha:CGFloat) {
        UIView.animate(withDuration:ViewConstants.Renamer.animateDuration) { [weak self] in
            self?.view.alpha = alpha
        }
    }
}
