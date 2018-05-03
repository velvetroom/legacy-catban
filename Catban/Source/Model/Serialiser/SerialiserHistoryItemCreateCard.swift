import Foundation

class SerialiserHistoryItemCreateCard:SerialiserHistoryItem {
    required init() {
        super.init()
        self.itemType = SerialiserHistoryItemType.createCard
    }
        
    override func serialiseDetailsFor(item:HistoryItemProtocol) -> [String:Any] {
        let item:HistoryItemCreateCard = item as! HistoryItemCreateCard
        var serialised:[String:Any] = [:]
        serialised[Serialiser.Constants.History.cardIdentifier] = item.cardIdentifier
        return serialised
    }
}
