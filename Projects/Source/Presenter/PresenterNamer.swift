import UIKit
import Shared

public class PresenterNamer:NSObject, PresenterProtocol, UITextFieldDelegate {
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    
    public required override init() {
        super.init()
    }
}
