import Foundation

extension History {
    func created(card:ProjectCard) {
        var item:HistoryItemCreateCard = HistoryItemCreateCard()
        item.cardIdentifier = card.identifier
        self.items.append(item)
    }
    
    func moved(card:ProjectCard, to column:ProjectColumn) {
        var item:HistoryItemMoveCard = HistoryItemMoveCard()
        item.cardIdentifier = card.identifier
        item.columnIdentifier = column.identifier
        self.items.append(item)
    }
}
