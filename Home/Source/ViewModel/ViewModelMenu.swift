import Foundation
import Shared

struct ViewModelMenu:ViewModelPropertyProtocol {
    var observing:((ViewModelMenu) -> Void)?
    var hidden:Bool
    
    init() {
        self.hidden = true
    }
}
