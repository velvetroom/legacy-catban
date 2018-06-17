import Foundation

public struct ViewModelNavigation:ViewModelPropertyProtocol {
    public weak var observer:ViewModelObserverProtocol?
    public var toolbarHidden:Bool
    public var navigationbarHidden:Bool
    
    public init() {
        self.toolbarHidden = true
        self.navigationbarHidden = false
    }
}
