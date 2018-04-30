import Foundation

class DeserialiserHistoryItem {
    var created:Int
    
    required init() {
        self.created = 0
    }
    
    final func deserialise(item:[String:Any]) throws -> HistoryItemProtocol {
        try self.deserialiseGeneric(item:item)
        return try self.deserialiseDetailsFor(item:item)
    }
    
    func deserialiseDetailsFor(item:[String:Any]) throws -> HistoryItemProtocol {
        throw ErrorRepository.malformedData
    }
    
    private func deserialiseGeneric(item:[String:Any]) throws {
        guard
            let created:Int = item[Serialiser.Constants.History.created] as? Int
        else { throw ErrorRepository.malformedData }
        self.created = created
    }
}
