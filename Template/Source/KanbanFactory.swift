import Foundation
import Board
import Shared

public class KanbanFactory:TemplateFactoryProtocol {
    public class func newProject() -> ProjectProtocol {
        let project:ProjectProtocol = kanbanProject()
        project.add(column:backlogColumn())
        project.add(column:progressColumn())
        project.add(column:doneColumn())
        return project
    }
    
    private class func kanbanProject() -> ProjectProtocol {
        let project:ProjectProtocol = ProjectFactory.newProject()
        project.name = String.localized(key:"KanbanFactory_project_name", in:self)
        return project
    }
    
    private class func backlogColumn() -> ColumnProtocol {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.name = String.localized(key:"KanbanFactory_backlogColumn_name", in:self)
        column.add(card:kanbanIntroCard())
        column.add(card:editProjectCard())
        return column
    }
    
    private class func progressColumn() -> ColumnProtocol {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.name = String.localized(key:"KanbanFactory_progressColumn_name", in:self)
        return column
    }
    
    private class func doneColumn() -> ColumnProtocol {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.name = String.localized(key:"KanbanFactory_doneColumn_name", in:self)
        return column
    }
    
    private class func kanbanIntroCard() -> CardProtocol {
        let card:CardProtocol = CardFactory.newCard()
        card.content = String.localized(key:"KanbanFactory_kanbanIntro_content", in:self)
        return card
    }
    
    private class func editProjectCard() -> CardProtocol {
        let card:CardProtocol = CardFactory.newCard()
        card.content = String.localized(key:"KanbanFactory_editProject_content", in:self)
        return card
    }
    
    private init() { }
}
