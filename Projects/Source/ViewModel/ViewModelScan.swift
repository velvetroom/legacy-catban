import Foundation
import CleanArchitecture

struct ViewModelScan:ViewModelPropertyProtocol {
    var observing:((ViewModelScan) -> Void)?
    var message:String
    var spinnerAnimating:Bool
    var buttonAcceptHidden:Bool
    var buttonContinueHidden:Bool
    
    init() {
        self.message = String()
        self.spinnerAnimating = false
        self.buttonAcceptHidden = true
        self.buttonContinueHidden = true
    }
}
