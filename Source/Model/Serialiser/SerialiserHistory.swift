import Foundation

class SerialiserHistory {
    private static var serialiserMap:[ObjectIdentifier:SerialiserHistoryItem.Type] {
        get {
            return [
                ObjectIdentifier(HistoryItemCreateCard.self) : SerialiserHistoryItemCreateCard.self,
                ObjectIdentifier(HistoryItemMoveCard.self) : SerialiserHistoryItemMoveCard.self]
        }
    }
    
    class func serialise(item:HistoryItemProtocol) -> [String:Any] {
        let serialiser:SerialiserHistoryItem = serialiserFor(item:item)
        return serialiser.serialise(item:item)
    }
    
    class func serialiserFor(item:HistoryItemProtocol) -> SerialiserHistoryItem {
        let itemType:HistoryItemProtocol.Type = type(of:item)
        let identifier:ObjectIdentifier = ObjectIdentifier(itemType)
        let serialiserType:SerialiserHistoryItem.Type = serialiserMap[identifier]!
        return serialiserType.init()
    }
}
