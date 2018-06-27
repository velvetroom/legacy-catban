import UIKit
import CleanArchitecture

struct ViewModelSelected:ViewModelPropertyProtocol {
    var observing:((ViewModelSelected) -> Void)?
    var indexPath:IndexPath?
}
