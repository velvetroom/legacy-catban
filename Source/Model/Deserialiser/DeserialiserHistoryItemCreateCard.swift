import Foundation

class DeserialiserHistoryItemCreateCard:DeserialiserHistoryItem {
    override func deserialiseDetailsFor(item: [String : Any]) throws -> HistoryItemProtocol {
        throw ErrorRepository.malformedData
    }
}
