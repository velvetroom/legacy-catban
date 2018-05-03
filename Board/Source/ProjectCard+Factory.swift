import Foundation

extension ProjectCard {
    class func factoryCard() -> ProjectCard {
        let card:ProjectCard = ProjectCard()
        card.identifier = UUID().uuidString
        return card
    }
}
