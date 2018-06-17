import Foundation
import Shared

public struct DeleterViewModel:ViewModelPropertyProtocol {
    public weak var observer:ViewModelObserverProtocol?
    public var itemType:String
    public var name:String
    
    public init() {
        self.itemType = String()
        self.name = String()
    }
}
