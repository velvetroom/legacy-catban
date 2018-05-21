import Foundation

extension Model {
    func add(columns:[MapColumnProtocol]) {
        for column:MapColumnProtocol in columns {
            self.add(column:column)
        }
        self.updateSize()
    }
    
    private func add(column:MapColumnProtocol) {
        column.minX = self.contentWidth
        self.columns.append(column)
    }
}
