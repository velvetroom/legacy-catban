import Foundation

extension Project {
    func cardAt(indexPath:IndexPath) -> ProjectCard {
        return columnAt(index:indexPath.section).cardAt(index:indexPath.item)
    }
    
    func createCard() -> ProjectCard {
        return ProjectCard()
    }
}
