import Foundation
@testable import catban

class MockProjectProtocol:ProjectProtocol {
    var onMoveCard:((IndexPath, IndexPath) -> Void)?
    var onCardAtIndex:((IndexPath) -> Void)?
    var onIndexForCard:(() -> Void)?
    var onIndexForNewCard:(() -> Void)?
    var onInsertCardAt:(() -> Void)?
    var returnCard:ProjectCard
    var returnColumn:ProjectColumn
    var indexForCard:IndexPath
    var columns:[ProjectColumn]
    var name:String
    
    init() {
        self.columns = []
        self.name = String()
        self.indexForCard = IndexPath(item:0, section:0)
        self.returnCard = ProjectCard()
        self.returnColumn = ProjectColumn()
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveCard?(origin, destination)
    }
    
    func indexOnRightForCardAt(index:IndexPath) -> IndexPath {
        self.onIndexForCard?()
        return self.indexForCard
    }
    
    func indexOnLeftForCardAt(index:IndexPath) -> IndexPath {
        self.onIndexForCard?()
        return self.indexForCard
    }
    
    func cardAt(indexPath:IndexPath) -> ProjectCard {
        self.onCardAtIndex?(indexPath)
        return self.returnCard
    }
    
    func columnAt(index:Int) -> ProjectColumn {
        return self.returnColumn
    }
    
    func columnAt(indexPath:IndexPath) -> ProjectColumn {
        return self.returnColumn
    }
    
    func indexForNewCard() -> IndexPath {
        self.onIndexForNewCard?()
        return IndexPath(item:0, section:0)
    }
    
    func insert(card:ProjectCard, at indexPath:IndexPath) {
        self.onInsertCardAt?()
    }
}
