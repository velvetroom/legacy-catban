import UIKit
import CleanArchitecture

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var icon:UIImage?
    var buttonHidden:Bool
    var message:String
    
    init() {
        self.buttonHidden = false
        self.message = String()
    }
}
