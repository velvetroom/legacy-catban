import Foundation

extension Model {
    func order(item:MapItemProtocol) {
        var parentColumn:MapColumnProtocol? = self.columns.first
        for column:MapColumnProtocol in self.columns {
            parentColumn = column
            if column.maxX > item.midX {
                break
            }
        }
        parentColumn?.order(item:item)
        self.updateSize()
    }
}
