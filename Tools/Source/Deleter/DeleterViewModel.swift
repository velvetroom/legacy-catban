import Foundation
import Shared

public struct DeleterViewModel:ViewModelProtocol {
    public var itemType:String
    public var name:String
    public var navigationbarHidden:Bool
    
    public init() {
        self.itemType = String()
        self.name = String()
        self.navigationbarHidden = true
    }
}
