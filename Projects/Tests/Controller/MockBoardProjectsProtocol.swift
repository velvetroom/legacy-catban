import Foundation
import Board

class MockBoardProjectsProtocol:BoardProjectsProtocol {
    var projects:[ProjectProtocol]
    var countProjects:Int {
        get {
            return self.projects.count
        }
    }
    
    init() {
        self.projects = []
    }
    
    func unmanage(project:ProjectManagedProtocol) { }
    func add(project:ProjectProtocol) { }
    func remove(project:ProjectProtocol) { }
    
    func iterate(projects:((ProjectProtocol) -> Void)) {
        self.projects.forEach(projects)
    }
    
    func manage(project:ProjectProtocol) -> ProjectManagedProtocol {
        return MockProjectManagedProtocol()
    }
    
    func projectAt(index:Int) -> ProjectProtocol {
        return MockProjectManagedProtocol()
    }
}
