import UIKit

class PresenterKeyboard {
    var outlets:PresenterOutlets!
    var notification:Notification!
    
    func adjustOutlets() {
        let keyboardHeight:CGFloat = self.keyboardHeightFrom(notification:notification)
        let duration:TimeInterval = self.animationDurationFrom(notification:notification)
        self.animateText(keyboardHeight:keyboardHeight, duration:duration)
    }
    
    private func keyboardHeightFrom(notification:Notification) -> CGFloat {
        let rect:CGRect = self.keyboardRectFrom(notification:notification)
        if let view:UIView = self.outlets.view?.view {
            let height:CGFloat = view.bounds.height
            if rect.minY < height {
                return -(height - rect.minY)
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
    
    private func animateText(keyboardHeight:CGFloat, duration:TimeInterval) {
        self.outlets.viewText?.layoutBottom.constant = keyboardHeight
        UIView.animate(withDuration:duration) { [weak self] in
            self?.outlets.view?.view.layoutIfNeeded()
        }
    }
}
