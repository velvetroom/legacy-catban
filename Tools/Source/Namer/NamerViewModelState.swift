import Foundation

struct NamerViewModelState {
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
