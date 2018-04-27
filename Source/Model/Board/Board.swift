import Foundation

class Board:BoardProtocol {
    var user:UserProtocol
    var projects:[ProjectProtocol]
    var project:ProjectProtocol {
        get {
            return self.user.project
        }
        set(newValue) {
            self.user.project = newValue
        }
    }
    
    private var projectIndex:Int {
        get {
            let count:Int = self.projects.count
            for index:Int in 0 ..< count {
                let project:ProjectProtocol = self.projects[index]
                if project.identifier == self.project.identifier {
                    return index
                }
            }
            return 0
        }
    }
    
    init() {
        self.user = User()
        self.projects = []
    }
    
    func selectProjectAt(index:Int) {
        self.project = self.projects[index]
    }
    
    func insertProject(project:ProjectProtocol) {
        self.projects.append(project)
    }
    
    func deleteProject() {
        self.projects.remove(at:self.projectIndex)
        self.project = self.projects[0]
    }
    
    func apply(updates:[UpdateProtocol]) {
        for update:UpdateProtocol in updates {
            update.strategy(board:self)
        }
    }
}
