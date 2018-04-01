import Foundation

extension Project {
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        let columnOrigin:ProjectColumn = self.columns[origin.section]
        let columnDestination:ProjectColumn = self.columns[destination.section]
        let card:ProjectCard = columnOrigin.remove(card:origin.item)
        columnDestination.insert(card:card, at:destination.item)
    }
}
