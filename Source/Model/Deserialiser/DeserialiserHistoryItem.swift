import Foundation

class DeserialiserHistoryItem {
    required init() { }
    
    final func deserialise(item:[String:Any]) throws -> HistoryItemProtocol {
        let history:HistoryItemProtocol = try self.deserialiseDetailsFor(item:item)
        return try self.deserialiseGeneric(history:history, item:item)
    }
    
    func deserialiseDetailsFor(item:[String:Any]) throws -> HistoryItemProtocol {
        throw ErrorRepository.malformedData
    }
    
    private func deserialiseGeneric(history:HistoryItemProtocol, item:[String:Any]) throws -> HistoryItemProtocol {
        guard
            let created:Int = item[Serialiser.Constants.History.created] as? Int
        else { throw ErrorRepository.malformedData }
        var history:HistoryItemProtocol = history
        history.created = created
        return history
    }
}
