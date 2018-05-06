import Foundation

class Project:ProjectProtocol {
    var identifier:String
    var created:Int
    
    init() {
        self.identifier = String()
        self.created = 0
    }
}
