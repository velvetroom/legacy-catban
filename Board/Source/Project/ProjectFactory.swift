import Foundation

public class ProjectFactory {
    public class func newKanbanProject() -> ProjectProtocol {
        let columnBacklog:ColumnProtocol = ColumnFactory.newColumnBacklog()
        let columnProgress:ColumnProtocol = ColumnFactory.newColumnProgress()
        let columnDone:ColumnProtocol = ColumnFactory.newColumnDone()
        var project:ProjectProtocol = newProject()
        project.name = String.localized(key:"ProjectFactory_newKanbanProject_name")
        project.add(column:columnBacklog)
        project.add(column:columnProgress)
        project.add(column:columnDone)
        return project
    }
    
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
