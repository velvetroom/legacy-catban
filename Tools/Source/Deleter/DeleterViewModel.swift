import Foundation
import CleanArchitecture

public struct DeleterViewModel:ViewModelPropertyProtocol {
    public var observing:((DeleterViewModel) -> Void)?
    public var title:String
    public var name:String
    
    public init() {
        self.title = String()
        self.name = String()
    }
}
