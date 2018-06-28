import Foundation

class ProjectManagedFactory {
    class func assign(manager:ProjectManagerProtocol, to project:ProjectProtocol) -> ProjectManagedProtocol {
        let managed:ProjectManagedProtocol = blankProjectManaged()
        managed.copy(project:project)
        managed.manager = manager
        return managed
    }
    
    class func blankProjectManaged() -> ProjectManagedProtocol {
        return ProjectManaged()
    }
    
    private init() { }
}
