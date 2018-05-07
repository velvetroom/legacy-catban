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
        self.remove(project:project)
        return ProjectManagedFactory.assign(manager:self, to:project)
    }
    
    func add(project:ProjectProtocol) {
        guard
            project.identifier.isEmpty == false
        else { return }
        self.projects.append(project)
    }
    
    func remove(project:ProjectProtocol) {
        let countProjects:Int = self.projects.count
        for index:Int in 0 ..< countProjects {
            let item:ProjectProtocol = self.projects[index]
            if project.identifier == item.identifier {
                self.projects.remove(at:index)
                break
            }
        }
    }
    
    static func == (lhs:Board, rhs:Board) -> Bool {
        return rhs.equals(model:lhs)
    }
}
