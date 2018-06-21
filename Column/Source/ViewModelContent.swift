import Foundation
import Shared

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var name:String
    
    init() {
        self.name = String()
    }
}
