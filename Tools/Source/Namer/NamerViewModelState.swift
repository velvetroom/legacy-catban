import Foundation

struct NamerViewModelState {
    var message:String
    var saveEnabled:Bool
    var statusValidVisible:Bool
    var statusErrorVisible:Bool
    
    init() {
        self.message = String()
        self.saveEnabled = false
        self.statusValidVisible = false
        self.statusErrorVisible = false
    }
}
