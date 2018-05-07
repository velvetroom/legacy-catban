import Foundation

public class ColumnFactory {
    public class func newColumn() -> ColumnProtocol {
        var column:ColumnProtocol = Column()
        column.identifier = UUID().uuidString
        column.created = Date.timestamp
        return column
    }
}
