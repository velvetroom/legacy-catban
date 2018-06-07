import UIKit

public protocol PresenterForKeyboardProtocol {
    var viewContainer:UIView? { get set }
    var layoutBottom:NSLayoutConstraint? { get set }
    
    func startListening()
}
