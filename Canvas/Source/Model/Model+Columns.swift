import Foundation

extension Model {
    var nestableColumns:[MapNestableColumnProtocol] {
        get {
            var columns:[MapNestableColumnProtocol] = []
            self.columns.forEach { (column:MapColumnProtocol) in
                if let column:MapNestableColumnProtocol = column as? MapNestableColumnProtocol {
                    columns.append(column)
                }
            }
            return columns
        }
    }
    
    func add(columns:[MapColumnProtocol]) {
        for column:MapColumnProtocol in columns {
            self.add(column:column)
        }
        self.updateSize()
    }
    
    func arrengeInColumns(item:MapItemProtocol) {
        let columns:[MapNestableColumnProtocol] = self.nestableColumns
        var parentColumn:MapNestableColumnProtocol? = columns.first
        for column:MapNestableColumnProtocol in columns {
            parentColumn = column
            if column.maxX > item.midX {
                break
            }
        }
        parentColumn?.arrange(item:item)
    }
    
    private func add(column:MapColumnProtocol) {
        column.minX = self.contentWidth
        self.columns.append(column)
    }
}
