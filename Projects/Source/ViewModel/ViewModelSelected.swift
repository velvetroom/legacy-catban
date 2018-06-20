import UIKit
import Shared

struct ViewModelSelected:ViewModelPropertyProtocol {
    var observing:((ViewModelSelected) -> Void)?
    var indexPath:IndexPath?
}
