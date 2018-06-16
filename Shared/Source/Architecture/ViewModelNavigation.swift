import Foundation

public struct ViewModelNavigation:ViewModelPropertyProtocol {
    weak var observer:ViewModelObserverProtocol?
    var toolbarHidden:Bool
    var navigationbarHidden:Bool
    
    init() {
        self.toolbarHidden = true
        self.navigationbarHidden = false
    }
}
