import Foundation
import Shared

struct NamerViewModelState:ViewModelPropertyProtocol {
    weak var observer:ViewModelObserverProtocol?
    var message:String
    var saveEnabled:Bool
    var statusValidHidden:Bool
    var statusErrorHidden:Bool
    
    init() {
        self.message = String()
        self.saveEnabled = false
        self.statusValidHidden = true
        self.statusErrorHidden = true
    }
}
