import UIKit

public protocol PresenterViewProtocol:class {
    var view:UIView! { get }
    
    func viewModelUpdated()
}
