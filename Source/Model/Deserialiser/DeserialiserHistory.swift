import Foundation

class DeserialiserHistory {
    class func deserialise(item:[String:Any]) throws -> HistoryItemProtocol {
        throw ErrorRepository.malformedData
    }
    
    class func deserialiserFor(identifier:String) throws -> DeserialiserHistoryItem.Type {
        let type:SerialiserHistoryItemType = try SerialiserHistoryItemType.factoryWith(identifier:identifier)
        let map:[SerialiserHistoryItemType:DeserialiserHistoryItem.Type] = deserialiserMap()
        guard
            let deserialiserType:DeserialiserHistoryItem.Type = map[type]
        else { throw ErrorRepository.malformedData }
        return deserialiserType
    }
    
    private class func deserialiserMap() -> [SerialiserHistoryItemType:DeserialiserHistoryItem.Type] {
        return [
            SerialiserHistoryItemType.CreatedCard : DeserialiserHistoryItemCreateCard.self]
    }
}
