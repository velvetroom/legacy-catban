import Foundation
import Board

extension Model {
    var order:Order {
        get {
            var order:Order = Order()
            let columns:[MapNestableColumnProtocol] = self.nestableColumns
            columns.forEach { (column:MapNestableColumnProtocol) in
                order.columns.append(column.order)
            }
            return order
        }
    }
    
    func updateProject() {
        self.projectOrder.orderWith(order:self.order)
    }
}
