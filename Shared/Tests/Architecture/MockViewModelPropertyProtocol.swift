import Foundation
@testable import Shared

struct MockViewModelPropertyProtocol:ViewModelPropertyProtocol {
    weak var observer:AnyObject?
    var name:String
    
    init() {
        self.name = String()
    }
}
