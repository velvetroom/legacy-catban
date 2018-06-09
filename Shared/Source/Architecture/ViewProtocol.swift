import UIKit

public protocol ViewProtocol:class {
    var view:UIView! { get }
    
    func viewModelUpdated()
}
