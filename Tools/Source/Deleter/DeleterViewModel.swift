import Foundation
import Shared

public struct DeleterViewModel:ViewModelProtocol {
    public var itemType:String
    public var name:String
    
    public init() {
        self.itemType = String()
        self.name = String()
    }
}
