import Foundation

struct HistoryItemCreateCard:HistoryItemProtocol {
    var cardIdentifier:String
    var created:Int
    
    init() {
        self.cardIdentifier = String()
        self.created = HistoryItemCreateCard.currentTimestamp()
    }
}
