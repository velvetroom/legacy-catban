import UIKit
import Shared

public struct NamerViewModelContent:ViewModelPropertyProtocol {
    public weak var observer:ViewModelObserverProtocol?
    public var title:String
    public var currentName:String
    
    public init() {
        self.title = String()
        self.currentName = String()
    }
}
