import UIKit

public protocol PresentingViewProtocol:class {
    var transition:TransitionProtocol! { get set }
    var toolbarHidden:Bool { get set }
    var navigationbarHidden:Bool { get set }
    var view:UIView! { get }
    
    init()
    func viewModelUpdated()
}
