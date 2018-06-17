import Foundation
@testable import Shared

struct MockViewModelPropertyProtocol:ViewModelPropertyProtocol {
    weak var observer:ViewModelObserverProtocol?
    var name:String
    
    init() {
        self.name = String()
    }
}
