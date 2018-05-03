import Foundation

class ProjectColumn {
    var cards:[ProjectCard]
    var name:String
    var identifier:String
    
    init() {
        self.cards = []
        self.name = String()
        self.identifier = String()
    }
    
    func cardAt(index:Int) -> ProjectCard {
        return self.cards[index]
    }
    
    func remove(card:Int) -> ProjectCard {
        return self.cards.remove(at:card)
    }
    
    func insert(card:ProjectCard, at index:Int) {
        self.cards.insert(card, at:index)
    }
    
    func deleteCardAt(index:Int) {
        self.cards.remove(at:index)
    }
}