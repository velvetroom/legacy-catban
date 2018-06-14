import Foundation
import Shared

public struct NamerViewModel:ViewModelProtocol {
    public var title:String
    public var currentName:String
    
    public init() {
        self.title = String()
        self.currentName = String()
    }
}
