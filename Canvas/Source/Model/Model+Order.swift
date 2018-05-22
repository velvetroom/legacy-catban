import Foundation
import Board

extension Model {
    var order:Order {
        get {
            var order:Order = Order()
            self.columns.forEach { (column:MapColumnProtocol) in
                if let nestableColumn:MapNestableColumnProtocol = column as? MapNestableColumnProtocol {
                    order.columns.append(nestableColumn.order)
                }
            }
            return order
        }
    }
    
    func updateProject() {
        self.projectOrder.orderWith(order:self.order)
    }
}
