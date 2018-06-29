import Foundation
import CleanArchitecture

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var title:String
    
    init() {
        self.title = String()
    }
}
