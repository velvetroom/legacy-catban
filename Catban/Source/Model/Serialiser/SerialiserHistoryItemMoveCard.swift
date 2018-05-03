import Foundation

class SerialiserHistoryItemMoveCard:SerialiserHistoryItem {
    required init() {
        super.init()
        self.itemType = SerialiserHistoryItemType.moveCard
    }
    
    override func serialiseDetailsFor(item:HistoryItemProtocol) -> [String:Any] {
        let item:HistoryItemMoveCard = item as! HistoryItemMoveCard
        var serialised:[String:Any] = [:]
        serialised[Serialiser.Constants.History.cardIdentifier] = item.cardIdentifier
        serialised[Serialiser.Constants.History.columnIdentifier] = item.columnIdentifier
        return serialised
    }
}
