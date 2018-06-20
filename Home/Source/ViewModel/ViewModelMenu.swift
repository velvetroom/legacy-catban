import Foundation
import Shared

struct ViewModelMenu:ViewModelPropertyProtocol {
    var observing:((ViewModelMenu) -> Void)?
    var show:Bool
    
    init() {
        self.show = true
    }
}
