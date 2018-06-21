import Foundation
import Shared

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var title:String
    var text:String
    
    init() {
        self.title = String()
        self.text = String()
    }
}
