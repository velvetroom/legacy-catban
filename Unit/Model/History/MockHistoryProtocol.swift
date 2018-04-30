import Foundation
@testable import catban

class MockHistoryProtocol:HistoryProtocol {
    var onCreatedCard:((ProjectCard) -> Void)?
    var onMovedCard:((ProjectCard, ProjectColumn) -> Void)?
    var items:[HistoryItemProtocol]
    
    init() {
        self.items = []
    }
    
    func created(card:ProjectCard) {
        self.onCreatedCard?(card)
    }
    
    func moved(card:ProjectCard, to column:ProjectColumn) {
        self.onMovedCard?(card, column)
    }
}
