import UIKit

public extension UIImage {
    convenience init(name:String, in type:AnyClass) {
        let bundle:Bundle = Bundle(for:type)
        self.init(named:name, in:bundle, compatibleWith:nil)!
    }
}
