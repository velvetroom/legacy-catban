import Foundation

extension SerialiserHistoryItemType {
    static func factoryWith(identifier:String) throws -> SerialiserHistoryItemType {
        guard
            let type:SerialiserHistoryItemType = SerialiserHistoryItemType(rawValue:identifier)
        else { throw ErrorRepository.malformedData }
        return type
    }
}
