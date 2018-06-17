import Foundation
import Shared

struct ViewModelContent:ViewModelPropertyProtocol {
    weak var observer:ViewModelObserverProtocol?
    var listHidden:Bool
    var emptyHidden:Bool
    
    public init() {
        self.listHidden = true
        self.emptyHidden = true
    }
}
