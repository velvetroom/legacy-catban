import Foundation

class DeserialiserHistoryItem {
    var created:Int
    
    init() {
        self.created = 0
    }
    
    final func deserialise(item:[String:Any]) throws -> HistoryItemProtocol {
        throw ErrorRepository.malformedData
    }
    
    func deserialiseDetailsFor(item:[String:Any]) throws -> HistoryItemProtocol {
        throw ErrorRepository.malformedData
    }
}
