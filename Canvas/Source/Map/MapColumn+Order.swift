import Foundation
import Board

extension MapColumn {
    var order:OrderColumn {
        get {
            var order:OrderColumn = OrderColumn()
            let children:[MapItemProtocol] = self.children
            children.forEach { (item:MapItemProtocol) in
                if let card:MapCardProtocol = item as? MapCardProtocol {
                    var orderCard:OrderCard = OrderCard()
                    orderCard.identifier = card.identifier
                    order.cards.append(orderCard)
                }
            }
            return order
        }
    }
}
