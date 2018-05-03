import Foundation

extension SerialiserHistoryItemType {
    static func factoryWith(itemType:String) throws -> SerialiserHistoryItemType {
        guard
            let type:SerialiserHistoryItemType = SerialiserHistoryItemType(rawValue:itemType)
        else { throw ErrorRepository.malformedData }
        return type
    }
}
