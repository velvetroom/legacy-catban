import Foundation

class DeserialiserHistoryItemCreateCard:DeserialiserHistoryItem {
    override func deserialiseDetailsFor(item:[String:Any]) throws -> HistoryItemProtocol {
        guard
            let cardIdentifier:String = item[Serialiser.Constants.History.cardIdentifier] as? String
        else { throw ErrorRepository.malformedData }
        var item:HistoryItemCreateCard = HistoryItemCreateCard()
        item.cardIdentifier = cardIdentifier
        return item
    }
}
