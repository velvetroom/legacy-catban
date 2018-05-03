import Foundation
@testable import catban

class MockDeserialiserHistoryItem:DeserialiserHistoryItem {
    override func deserialiseDetailsFor(item:[String:Any]) throws -> HistoryItemProtocol {
        return HistoryItemCreateCard()
    }
}
