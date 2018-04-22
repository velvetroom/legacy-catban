import Foundation

extension CollectionUpdateCreateProject {
    class func factoryNewProject() -> ProjectProtocol {
        var project:ProjectProtocol = factoryProject()
        project.columns = factoryColumns()
        return project
    }
    
    private class func factoryProject() -> ProjectProtocol {
        let project:Project = Project()
        project.identifier = UUID().uuidString
        project.name = String.localizedProject(key:"Project_newProjectName")
        return project
    }
    
    private class func factoryColumns() -> [ProjectColumn] {
        let column:ProjectColumn = ProjectColumn()
        column.name = String.localizedProject(key:"Project_newProjectColumnName")
        return [column]
    }
}
