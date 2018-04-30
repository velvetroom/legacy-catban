import Foundation

extension Project {
    class func factoryFirstProject() -> Project {
        let project:Project = Project()
        project.name = String.localizedProject(key:"Project_defaultName")
        project.columns = factoryDefaultColumns()
        project.identifier = UUID().uuidString
        project.history = factoryHistoryForCards(project:project)
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
        let firstCard:ProjectCard = factoryCardFirst()
        let secondCard:ProjectCard = factoryCardSecond()
        let thirdCard:ProjectCard = factoryCardThird()
        let column:ProjectColumn = ProjectColumn.factoryColumn()
        column.name = String.localizedProject(key:"Project_defaultColumnBacklog")
        column.cards.append(firstCard)
        column.cards.append(secondCard)
        column.cards.append(thirdCard)
        return column
    }
    
    private class func factoryColumnProgress() -> ProjectColumn {
        let column:ProjectColumn = ProjectColumn.factoryColumn()
        column.name = String.localizedProject(key:"Project_defaultColumnProgress")
        return column
    }
    
    private class func factoryColumnDone() -> ProjectColumn {
        let column:ProjectColumn = ProjectColumn.factoryColumn()
        column.name = String.localizedProject(key:"Project_defaultColumnDone")
        return column
    }
    
    private class func factoryCardFirst() -> ProjectCard {
        let card:ProjectCard = ProjectCard.factoryCard()
        card.title = String.localizedProject(key:"Project_defaultCardFirst")
        return card
    }
    
    private class func factoryCardSecond() -> ProjectCard {
        let card:ProjectCard = ProjectCard.factoryCard()
        card.title = String.localizedProject(key:"Project_defaultCardSecond")
        return card
    }
    
    private class func factoryCardThird() -> ProjectCard {
        let card:ProjectCard = ProjectCard.factoryCard()
        card.title = String.localizedProject(key:"Project_defaultCardThird")
        return card
    }
    
    private class func factoryHistoryForCards(project:Project) -> HistoryProtocol {
        let history:History = History()
        for column:ProjectColumn in project.columns {
            for card:ProjectCard in column.cards {
                history.created(card:card)
            }
        }
        return history
    }
}
