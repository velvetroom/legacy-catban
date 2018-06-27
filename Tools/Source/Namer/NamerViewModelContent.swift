import UIKit
import CleanArchitecture

public struct NamerViewModelContent:ViewModelPropertyProtocol {
    public var observing:((NamerViewModelContent) -> Void)?
    public var title:String
    public var currentName:String
    
    public init() {
        self.title = String()
        self.currentName = String()
    }
}
