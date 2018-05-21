import Foundation
import Board

extension Model {
    private var order:Order {
        get {
            var order:Order = Order()
            self.columns.forEach { (column:MapColumnProtocol) in
                order.columns.append(column.order)
            }
            return order
        }
    }
    
    func order(item:MapItemProtocol) {
        var parentColumn:MapColumnProtocol? = self.columns.first
        for column:MapColumnProtocol in self.columns {
            parentColumn = column
            if column.maxX > item.midX {
                break
            }
        }
        parentColumn?.order(item:item)
        self.afterOrdering()
    }
    
    private func afterOrdering() {
        self.updateSize()
        self.updateProject()
    }
    
    private func updateProject() {
        
    }
}
