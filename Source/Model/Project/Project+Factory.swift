import Foundation

extension Project {
    class func factoryNewProject() -> Project {
        let project:Project = Project()
        project.name = String.localizaedProject(key:"Project_defaultName")
        return project
    }
    
}
