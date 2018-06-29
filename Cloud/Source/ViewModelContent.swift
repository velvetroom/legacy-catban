import Foundation
import CleanArchitecture

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var notCloudedHidden:Bool
    var cloudHidden:Bool
    
    init() {
        self.notCloudedHidden = true
        self.cloudHidden = true
    }
}
