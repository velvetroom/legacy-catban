import Foundation
import CleanArchitecture

struct ViewModelProject:ViewModelPropertyProtocol {
    var observing:((ViewModelProject) -> Void)?
    var projectName:String
    
    init() {
        self.projectName = String()
    }
}
