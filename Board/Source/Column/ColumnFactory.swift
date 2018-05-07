import Foundation

public class ColumnFactory {
    public class func newColumn() -> ColumnProtocol {
        var column:ColumnProtocol = blankColumn()
        column.identifier = UUID().uuidString
        column.created = Date.timestamp
        return column
    }
    
    public class func blankColumn() -> ColumnProtocol {
        return Column()
    }
    
    class func newColumnBacklog() -> ColumnProtocol {
        let cardEditProject:CardProtocol = CardFactory.newEditProjectCard()
        let cardCheckStats:CardProtocol = CardFactory.newCheckStatsCard()
        var column:ColumnProtocol = newColumn()
        column.name = String.localized(key:"ColumnFactory_newColumnBacklog_name")
        column.add(card:cardEditProject)
        column.add(card:cardCheckStats)
        return column
    }
    
    class func newColumnProgress() -> ColumnProtocol {
        var column:ColumnProtocol = newColumn()
        column.name = String.localized(key:"ColumnFactory_newColumnProgress_name")
        return column
    }
    
    class func newColumnDone() -> ColumnProtocol {
        var column:ColumnProtocol = newColumn()
        column.name = String.localized(key:"ColumnFactory_newColumnDone_name")
        return column
    }
}
