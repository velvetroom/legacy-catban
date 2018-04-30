import Foundation

extension History {
    func created(card:ProjectCard) {
        var item:HistoryItemCreateCard = HistoryItemCreateCard()
        item.cardIdentifier = card.identifier
        self.items.append(item)
    }
}
