import UIKit

class PresenterForKeyboard:PresenterForKeyboardProtocol {
    weak var viewContainer:UIView?
    weak var layoutBottom:NSLayoutConstraint?
    weak var notificationCenter:NotificationCenter!
    
    init() {
        self.notificationCenter = NotificationCenter.default
    }
    
    deinit {
        self.notificationCenter.removeObserver(self)
    }
    
    func startListening() {
        self.notificationCenter.addObserver(forName:Notification.Name.UIKeyboardWillChangeFrame, object:nil, queue:OperationQueue.main) { [weak self] (notification:Notification) in
            self?.keyboardChanged(notification:notification)
        }
    }
    
    private func keyboardChanged(notification:Notification) {
        let keyboardHeight:CGFloat = self.keyboardHeightFrom(notification:notification)
        let duration:TimeInterval = self.animationDurationFrom(notification:notification)
        self.animateWith(keyboardHeight:keyboardHeight, duration:duration)
    }
    
    private func keyboardHeightFrom(notification:Notification) -> CGFloat {
        let rect:CGRect = self.keyboardRectFrom(notification:notification)
        if let view:UIView = self.viewContainer {
            let height:CGFloat = view.bounds.height
            if rect.minY < height {
                return -rect.height
            }
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
    
    private func animateWith(keyboardHeight:CGFloat, duration:TimeInterval) {
        self.layoutBottom?.constant = keyboardHeight
        UIView.animate(withDuration:duration) { [weak self] in
            self?.viewContainer?.layoutIfNeeded()
        }
    }
}
