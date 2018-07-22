import UIKit
import CleanArchitecture

struct ViewModelQr:ViewModelPropertyProtocol {
    var observing:((ViewModelQr) -> Void)?
    var image:UIImage?
}
