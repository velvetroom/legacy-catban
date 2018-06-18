import Foundation
import Shared

struct ViewModelContent:ViewModelPropertyProtocol {
    var observing:((ViewModelContent) -> Void)?
    var listHidden:Bool
    var emptyHidden:Bool
    
    public init() {
        self.listHidden = true
        self.emptyHidden = true
    }
}
