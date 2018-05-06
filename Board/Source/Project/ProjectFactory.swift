import Foundation

public class ProjectFactory {
    public class func newProject() -> ProjectProtocol {
        var project:ProjectProtocol = Project()
        project.identifier = UUID().uuidString
        project.created = Date.timestamp
        return project
    }
}
