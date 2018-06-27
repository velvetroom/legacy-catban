import UIKit

class KeyboardAdjuster:KeyboardAdjusterProtocol {
    weak var superview:UIView?
    weak var layoutBottom:NSLayoutConstraint?
    weak var notificationCenter:NotificationCenter!
    weak var view:UIView? {
        didSet {
            self.configureView()
            self.configureLayout()
        }
    }
    
    init() {
        self.notificationCenter = NotificationCenter.default
        self.startListening()
    }
    
    deinit {
        self.notificationCenter.removeObserver(self)
    }
    
    private func configureView() {
        self.superview = self.view?.superview
    }
    
    private func configureLayout() {
        if let superview:UIView = self.superview {
            self.layoutBottom = self.view?.bottomAnchor.constraint(equalTo:superview.bottomAnchor)
            self.layoutBottom?.isActive = true
        }
    }
    
    private func startListening() {
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
        if let superview:UIView = self.superview {
            let height:CGFloat = superview.bounds.height
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
            self?.superview?.layoutIfNeeded()
        }
    }
}
