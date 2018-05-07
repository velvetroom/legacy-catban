import Foundation

class ProjectManagedFactory {
    class func assign(manager:BoardProjectsProtocol, to project:ProjectProtocol) -> ProjectManagedProtocol {
        var managed:ProjectManagedProtocol = blankProjectManaged()
        managed.copy(project:project)
        managed.manager = manager
        return managed
    }
    
    class func blankProjectManaged() -> ProjectManagedProtocol {
        return ProjectManaged()
    }
}
