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
    
    public class func makeSynchable(project:ProjectProtocol) -> ProjectSynchedProtocol {
        let synchable:ProjectSynchedProtocol = ProjectSynched()
        synchable.copy(project:project)
        return synchable
    }
    
    private init() { }
}
