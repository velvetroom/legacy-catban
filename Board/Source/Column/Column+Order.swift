import Foundation

extension Column {
    func orderWith(order:OrderColumn, and cards:[String:CardProtocol]) {
        self.cards = []
        self.add(cards:cards, in:order)
    }
    
    private func add(cards:[String:CardProtocol], in order:OrderColumn) {
        for orderedCard:OrderCard in order.cards {
            guard
                let card:CardProtocol = cards[orderedCard.identifier]
            else { continue }
            self.add(card:card)
        }
    }
}
