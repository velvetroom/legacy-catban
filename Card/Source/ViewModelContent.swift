import Foundation
import CleanArchitecture

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var title:String
    var text:String
    
    init() {
        self.title = String()
        self.text = String()
    }
}
