import Foundation
import Board

class MockBoardProjectsProtocol:BoardProjectsProtocol {
    var projects:[ProjectProtocol]
    var project:ProjectProtocol?
    
    var firstProject:ProjectProtocol? {
        get {
            return nil
        }
    }
    
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
    
    func projectWith(identifier:String) -> ProjectProtocol {
        return self.project!
    }
    
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
