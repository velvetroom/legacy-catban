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
}
