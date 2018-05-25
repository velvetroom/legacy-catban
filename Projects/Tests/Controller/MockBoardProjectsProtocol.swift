import Foundation
import Board

class MockBoardProjectsProtocol:BoardProjectsProtocol {
    var countProjects:Int
    
    init() {
        self.countProjects = 0
    }
    
    func unmanage(project:ProjectManagedProtocol) { }
    func add(project:ProjectProtocol) { }
    func remove(project:ProjectProtocol) { }
    func iterate(projects:((ProjectProtocol) -> Void)) { }
    
    func manage(project:ProjectProtocol) -> ProjectManagedProtocol {
        return MockProjectManagedProtocol()
    }
    
    func projectAt(index:Int) -> ProjectProtocol {
        return MockProjectManagedProtocol()
    }
}
