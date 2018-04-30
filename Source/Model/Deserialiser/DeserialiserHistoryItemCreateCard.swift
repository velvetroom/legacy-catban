import Foundation

class DeserialiserHistoryItemCreateCard:DeserialiserHistoryItem {
    private var item:HistoryItemCreateCard {
        get {
            var item:HistoryItemCreateCard = HistoryItemCreateCard()
            item.created = self.created
            return item
        }
    }
    
    override func deserialiseDetailsFor(item:[String:Any]) throws -> HistoryItemProtocol {
        guard
            let cardIdentifier:String = item[Serialiser.Constants.History.cardIdentifier] as? String
        else { throw ErrorRepository.malformedData }
        var item:HistoryItemCreateCard = self.item
        item.cardIdentifier = cardIdentifier
        return item
    }
}
