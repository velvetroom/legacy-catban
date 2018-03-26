import Foundation

extension Project {
    class func factoryNewProject() -> Project {
        let project:Project = Project()
        project.name = String.localizedProject(key:"Project_defaultName")
        project.columns = factoryDefaultColumns()
        return project
    }
    
    class func factoryDefaultColumns() -> [ProjectColumn] {
        let columnBacklog:ProjectColumn = factoryColumnBacklog()
        let columnProgress:ProjectColumn = factoryColumnProgress()
        let columnDone:ProjectColumn = factoryColumnDone()
        let columns:[ProjectColumn] = [
            columnBacklog,
            columnProgress,
            columnDone]
        return columns
    }
    
    private class func factoryColumnBacklog() -> ProjectColumn {
        let firstCard:ProjectCard = factoryCardFirstProject()
        let column:ProjectColumn = ProjectColumn()
        column.name = String.localizedProject(key:"Project_defaultColumnBacklog")
        column.cards.append(firstCard)
        return column
    }
    
    private class func factoryColumnProgress() -> ProjectColumn {
        let column:ProjectColumn = ProjectColumn()
        column.name = String.localizedProject(key:"Project_defaultColumnProgress")
        return column
    }
    
    private class func factoryColumnDone() -> ProjectColumn {
        let column:ProjectColumn = ProjectColumn()
        column.name = String.localizedProject(key:"Project_defaultColumnDone")
        return column
    }
    
    private class func factoryCardFirstProject() -> ProjectCard {
        let card:ProjectCard = ProjectCard()
        card.title = String.localizedProject(key:"Project_defaultCardFirstProject")
        return card
    }
}
