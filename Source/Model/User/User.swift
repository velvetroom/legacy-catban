import Foundation

class User:UserProtocol {
    var identifier:String
    var project:ProjectProtocol
    
    init() {
        self.identifier = String()
        self.project = Project()
    }
}
