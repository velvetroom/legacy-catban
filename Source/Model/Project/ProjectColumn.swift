import Foundation

class ProjectColumn {
    var cards:[ProjectCard]
    var name:String
    
    init() {
        self.cards = []
        self.name = String()
    }
    
    func remove(card:Int) -> ProjectCard {
        return self.cards.remove(at:card)
    }
    
    func insert(card:ProjectCard, at index:Int) {
        self.cards.insert(card, at:index)
    }
}
