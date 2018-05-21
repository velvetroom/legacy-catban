import Foundation

extension Project {
    func orderWith(order:Order) {
        let mapColumns:[String:ColumnProtocol] = self.mapColumns
        let mapCards:[String:CardProtocol] = self.mapCards
        self.columns = []
        self.add(columns:mapColumns, and:mapCards, in:order)
    }
    
    private func add(columns:[String:ColumnProtocol], and cards:[String:CardProtocol], in order:Order) {
        for orderedColumn:OrderColumn in order.columns {
            guard
                let column:ColumnProtocol = columns[orderedColumn.identifier]
            else { continue }
            column.orderWith(order:orderedColumn, and:cards)
            self.add(column:column)
        }
    }
}
