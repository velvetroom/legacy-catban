import Foundation
import Board

extension MapColumn {
    var order:OrderColumn {
        get {
            var order:OrderColumn = OrderColumn()
            order.identifier = self.identifier
            order.cards = self.orderCards
            return order
        }
    }
    
    private var orderCards:[OrderCard] {
        get {
            let children:[MapItemProtocol] = self.children
            var cards:[OrderCard] = []
            children.forEach { (item:MapItemProtocol) in
                if let card:MapCardProtocol = item as? MapCardProtocol {
                    var orderCard:OrderCard = OrderCard()
                    orderCard.identifier = card.identifier
                    cards.append(orderCard)
                }
            }
            return cards
        }
    }
}
