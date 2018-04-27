import Foundation
@testable import catban

class MockHistoryProtocol:HistoryProtocol {
    var onCreatedCard:((ProjectCard) -> Void)?
    var items:[HistoryItemProtocol]
    
    init() {
        self.items = []
    }
    
    func created(card:ProjectCard) {
        self.onCreatedCard?(card)
    }
}
