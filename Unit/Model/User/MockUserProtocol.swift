import Foundation
@testable import catban

class MockUserProtocol:UserProtocol {
    var identifier:String
    var project:ProjectProtocol
    
    init() {
        self.identifier = String()
        self.project = Project()
    }
}
