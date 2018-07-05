import UIKit
import CleanArchitecture

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var icon:UIImage?
    var buttonStartHidden:Bool
    var buttonContinueHidden:Bool
    var message:String
    
    init() {
        self.buttonStartHidden = true
        self.buttonContinueHidden = true
        self.message = String()
    }
}
