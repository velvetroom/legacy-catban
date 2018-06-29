import Foundation
import CleanArchitecture

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var projectName:String
    
    init() {
        self.projectName = String()
    }
}
