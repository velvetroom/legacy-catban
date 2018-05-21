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
    
    func updateProject() {
        
    }
}
