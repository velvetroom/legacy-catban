import Foundation

struct HistoryItemMoveCard:HistoryItemProtocol {
    var cardIdentifier:String
    var columnIdentifier:String
    var created:Int
    
    init() {
        self.cardIdentifier = String()
        self.columnIdentifier = String()
        self.created = HistoryItemCreateCard.currentTimestamp()
    }
}
