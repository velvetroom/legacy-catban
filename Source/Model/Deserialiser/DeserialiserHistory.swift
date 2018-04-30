import Foundation

class DeserialiserHistory {
    class func deserialise(item:[String:Any]) throws -> HistoryItemProtocol {
        throw ErrorRepository.malformedData
    }
}
