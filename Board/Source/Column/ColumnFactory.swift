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
}
