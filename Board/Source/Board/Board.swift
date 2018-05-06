import Foundation

class Board:BoardProtocol {
    var identifier:String
    var countProjects:Int {
        get {
            return 0
        }
    }
    
    init() {
        self.identifier = String()
    }
}
