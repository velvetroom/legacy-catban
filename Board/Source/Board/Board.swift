import Foundation

class Board:BoardProtocol, Equatable {
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
    
    func manage(project:ProjectProtocol) -> ProjectManagedProtocol {
        let managed:ProjectManaged = ProjectManaged()
        managed.manager = self
        return managed
    }
    
    static func == (lhs:Board, rhs:Board) -> Bool {
        return rhs.equals(model:lhs)
    }
}
