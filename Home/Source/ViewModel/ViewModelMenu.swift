import Foundation
import CleanArchitecture

struct ViewModelMenu:ViewModelPropertyProtocol {
    var observing:((ViewModelMenu) -> Void)?
    var show:Bool
    
    init() {
        self.show = true
    }
}
