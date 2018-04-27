import Foundation

struct HistoryItemCreateCard:HistoryItemProtocol {
    var card:ProjectCard
    var created:Int
    
    init() {
        self.card = ProjectCard()
        self.created = HistoryItemCreateCard.currentTimestamp()
    }
}
