import UIKit
import CleanArchitecture

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var icon:UIImage?
    var actionHidden:Bool
    var message:String
    
    init() {
        self.actionHidden = false
        self.message = String()
    }
}
