import Foundation

class Board:BoardProtocol, Equatable {
    var identifier:String
    var projects:[ProjectProtocol]
    
    var firstProject:ProjectProtocol? {
        get {
            return self.projects.first
        }
    }
    
    var countProjects:Int {
        get {
            return self.projects.count
        }
    }
    
    init() {
        self.identifier = String()
        self.projects = []
    }
    
    func add(project:ProjectProtocol) {
        guard
            project.identifier.isEmpty == false
        else { return }
        project.board = self
        self.projects.append(project)
    }
    
    func remove(project:ProjectProtocol) {
        let countProjects:Int = self.projects.count
        for index:Int in 0 ..< countProjects {
            let item:ProjectProtocol = self.projects[index]
            if project.identifier == item.identifier {
                item.board = nil
                self.projects.remove(at:index)
                break
            }
        }
    }
    
    func projectWith(identifier:String) -> ProjectProtocol {
        var found:ProjectProtocol!
        for project:ProjectProtocol in self.projects {
            if project.identifier == identifier {
                found = project
                break
            }
        }
        return found
    }
    
    func iterate(projects:((ProjectProtocol) -> Void)) {
        self.projects.forEach(projects)
    }
    
    static func == (lhs:Board, rhs:Board) -> Bool {
        return rhs.equals(model:lhs)
    }
}
