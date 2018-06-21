import UIKit
import Shared

struct ViewModelSelector:ViewModelPropertyProtocol {
    var observing:((ViewModelSelector) -> Void)?
    var positionY:CGFloat
    
    init() {
        self.positionY = 0
    }
}
