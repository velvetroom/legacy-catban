import Foundation

public struct ViewModelNavigation:ViewModelPropertyProtocol {
    public weak var observer:AnyObject?
    var toolbarHidden:Bool
    var navigationbarHidden:Bool
    
    init() {
        self.toolbarHidden = true
        self.navigationbarHidden = false
    }
}
