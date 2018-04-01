import Foundation

extension Project {
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        let columnOrigin:ProjectColumn = self.columnAt(indexPath:origin)
        let columnDestination:ProjectColumn = self.columnAt(indexPath:destination)
        let card:ProjectCard = columnOrigin.remove(card:origin.item)
        columnDestination.insert(card:card, at:destination.item)
    }
    
    func indexOnRightForCardAt(index:IndexPath) -> IndexPath {
        let rightColumn:Int = index.section + 1
        return newCardIndexFor(column:rightColumn)
    }
    
    func indexOnLeftForCardAt(index:IndexPath) -> IndexPath {
        let rightColumn:Int = index.section - 1
        return newCardIndexFor(column:rightColumn)
    }
    
    func newCardIndexFor(column:Int) -> IndexPath {
        let destination:ProjectColumn = self.columnAt(index:column)
        let cardsSize:Int = destination.cards.count
        return IndexPath(item:cardsSize, section:column)
    }
}
