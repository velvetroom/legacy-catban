import UIKit
import CleanArchitecture

struct ViewModelSelector:ViewModelPropertyProtocol {
    var observing:((ViewModelSelector) -> Void)?
    var positionY:CGFloat
    
    init() {
        self.positionY = 0
    }
}
