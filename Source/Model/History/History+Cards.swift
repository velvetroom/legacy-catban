import Foundation

extension History {
    func created(card:ProjectCard) {
        var item:HistoryItemCreateCard = HistoryItemCreateCard()
        item.card = card
        self.items.append(item)
    }
}
