import Foundation

extension Project {
    func cardAt(indexPath:IndexPath) -> ProjectCard {
        return columnAt(index:indexPath.section).cardAt(index:indexPath.item)
    }
    
    func indexForNewCard() -> IndexPath {
        return self.newCardIndexFor(column:0)
    }
    
    func insert(card:ProjectCard, at indexPath:IndexPath) {
        let column:ProjectColumn = self.columnAt(indexPath:indexPath)
        column.insert(card:card, at:indexPath.item)
    }
    
    func deleteCardAt(indexPath:IndexPath) {
        let column:ProjectColumn = self.columnAt(indexPath:indexPath)
        column.deleteCardAt(index:indexPath.item)
    }
}
