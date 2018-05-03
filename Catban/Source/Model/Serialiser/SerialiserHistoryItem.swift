import Foundation

class SerialiserHistoryItem {
    var itemType:SerialiserHistoryItemType
    
    required init() {
        self.itemType = SerialiserHistoryItemType.unknown
    }
    
    final func serialise(item:HistoryItemProtocol) -> [String:Any] {
        let serialised:[String:Any] = self.serialiseDetailsFor(item:item)
        return self.serialiseGenericsFor(serialised:serialised, item:item)
    }
    
    func serialiseDetailsFor(item:HistoryItemProtocol) -> [String:Any] { return [:] }
    
    private func serialiseGenericsFor(serialised:[String:Any], item:HistoryItemProtocol) -> [String:Any] {
        var serialised:[String:Any] = serialised
        serialised[Serialiser.Constants.History.itemType] = self.itemType.rawValue
        serialised[Serialiser.Constants.History.created] = item.created
        return serialised
    }
}
