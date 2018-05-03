import Foundation

class DeserialiserHistoryItemMoveCard:DeserialiserHistoryItem {
    override func deserialiseDetailsFor(item:[String:Any]) throws -> HistoryItemProtocol {
        guard
            let cardIdentifier:String = item[Serialiser.Constants.History.cardIdentifier] as? String,
            let columnIdentifier:String = item[Serialiser.Constants.History.columnIdentifier] as? String
        else { throw ErrorRepository.malformedData }
        var item:HistoryItemMoveCard = HistoryItemMoveCard()
        item.cardIdentifier = cardIdentifier
        item.columnIdentifier = columnIdentifier
        return item
    }
}
