import Foundation

public struct ViewModelNavigation:ViewModelPropertyProtocol {
    public var observing:((ViewModelNavigation) -> Void)?
    public var toolbarHidden:Bool
    public var navigationbarHidden:Bool
    
    public init() {
        self.toolbarHidden = true
        self.navigationbarHidden = false
    }
}
