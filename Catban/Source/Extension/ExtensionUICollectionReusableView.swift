import UIKit

extension UICollectionReusableView {
    class var reusableIdentifier:String {
        get {
            return String(describing:self)
        }
    }
}
