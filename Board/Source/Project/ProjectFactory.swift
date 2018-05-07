import Foundation

public class ProjectFactory {
    public class func newProject() -> ProjectProtocol {
        var project:ProjectProtocol = blankProject()
        project.identifier = UUID().uuidString
        project.created = Date.timestamp
        return project
    }
    
    public class func blankProject() -> ProjectProtocol {
        return Project()
    }
    
    class func removeManagementFrom(project:ProjectManagedProtocol) -> ProjectProtocol {
        let unmanaged:ProjectProtocol = blankProject()
        unmanaged.copy(project:project)
        return unmanaged
    }
}
