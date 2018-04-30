import Foundation

class DeserialiserHistory {
    class func deserialise(item:[String:Any]) throws -> HistoryItemProtocol {
        guard
            let itemType:String = item[Serialiser.Constants.History.itemType] as? String
        else { throw ErrorRepository.malformedData }
        let deserialiserType:DeserialiserHistoryItem.Type = try self.deserialiserFor(itemType:itemType)
        let deserialiser:DeserialiserHistoryItem = deserialiserType.init()
        return try deserialiser.deserialise(item:item)
    }
    
    class func deserialiserFor(itemType:String) throws -> DeserialiserHistoryItem.Type {
        let type:SerialiserHistoryItemType = try SerialiserHistoryItemType.factoryWith(itemType:itemType)
        let map:[SerialiserHistoryItemType:DeserialiserHistoryItem.Type] = deserialiserMap()
        guard
            let deserialiserType:DeserialiserHistoryItem.Type = map[type]
        else { throw ErrorRepository.malformedData }
        return deserialiserType
    }
    
    private class func deserialiserMap() -> [SerialiserHistoryItemType:DeserialiserHistoryItem.Type] {
        return [
            SerialiserHistoryItemType.CreateCard : DeserialiserHistoryItemCreateCard.self]
    }
}
