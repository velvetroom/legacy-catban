import Foundation

class Board:BoardProtocol {
    var identifier:String
    var projects:[ProjectProtocol]
    var countProjects:Int {
        get {
            return self.projects.count
        }
    }
    
    init() {
        self.identifier = String()
        self.projects = []
    }
}
