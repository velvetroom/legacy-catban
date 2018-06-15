import UIKit
import Shared

public struct NamerViewModel:ViewModelProtocol {
    public var title:String
    public var currentName:String
    var state:NamerViewModelState
    
    public init() {
        self.title = String()
        self.currentName = String()
        self.state = NamerViewModelState()
    }
}
