import Foundation
import Board
import Shared

public class KanbanFactory {
    public class func newProject() -> ProjectProtocol {
        let project:ProjectProtocol = kanbanProject()
        project.add(column:backlogColumn())
        project.add(column:progressColumn())
        project.add(column:doneColumn())
        return project
    }
    
    private class func kanbanProject() -> ProjectProtocol {
        var project:ProjectProtocol = ProjectFactory.newProject()
        project.name = String.localized(key:"KanbanFactory_project_name", in:self)
        return project
    }
    
    private class func backlogColumn() -> ColumnProtocol {
        var column:ColumnProtocol = ColumnFactory.newColumn()
        column.name = String.localized(key:"KanbanFactory_backlogColumn_name", in:self)
        column.add(card:editProjectCard())
        column.add(card:checkStatsCard())
        return column
    }
    
    private class func progressColumn() -> ColumnProtocol {
        var column:ColumnProtocol = ColumnFactory.newColumn()
        column.name = String.localized(key:"KanbanFactory_progressColumn_name", in:self)
        return column
    }
    
    private class func doneColumn() -> ColumnProtocol {
        var column:ColumnProtocol = ColumnFactory.newColumn()
        column.name = String.localized(key:"KanbanFactory_doneColumn_name", in:self)
        return column
    }
    
    private class func editProjectCard() -> CardProtocol {
        var card:CardProtocol = CardFactory.newCard()
        card.content = String.localized(key:"KanbanFactory_editProjectCard_content", in:self)
        return card
    }
    
    private class func checkStatsCard() -> CardProtocol {
        var card:CardProtocol = CardFactory.newCard()
        card.content = String.localized(key:"KanbanFactory_checkStatsCard_content", in:self)
        return card
    }
}
