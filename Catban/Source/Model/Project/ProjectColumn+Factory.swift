import Foundation

extension ProjectColumn {
    class func factoryColumn() -> ProjectColumn {
        let column:ProjectColumn = ProjectColumn()
        column.identifier = UUID().uuidString
        return column
    }
}
