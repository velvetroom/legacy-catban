import UIKit
import Shared

class MockPresenterForKeyboard:PresenterForKeyboardProtocol {
    var onStartListening:(() -> Void)?
    var viewContainer:UIView?
    var layoutBottom:NSLayoutConstraint?
    
    func startListening() {
        self.onStartListening?()
    }
}
