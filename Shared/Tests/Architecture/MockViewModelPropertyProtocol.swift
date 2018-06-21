import Foundation
@testable import Shared

struct MockViewModelPropertyProtocol:ViewModelPropertyProtocol {
    var observing:((MockViewModelPropertyProtocol) -> Void)?
    var name:String
    
    init() {
        self.name = String()
    }
}
