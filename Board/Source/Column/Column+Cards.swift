import Foundation

extension Column {
    var countCards:Int {
        get {
            return self.cards.count
        }
    }
    
    func add(card:CardProtocol) {
        guard
            card.identifier.isEmpty == false
        else { return }
        var card:CardProtocol = card
        self.cards.append(card)
        card.container = self
    }
    
    func remove(card:CardProtocol) {
        let countCards:Int = self.cards.count
        for index:Int in 0 ..< countCards {
            let item:CardProtocol = self.cards[index]
            if card.identifier == item.identifier {
                self.cards.remove(at:index)
                break
            }
        }
    }
    
    func iterate(cards:((CardProtocol) -> Void)) {
        self.cards.forEach(cards)
    }
    
    func cardWith(identifier:String) -> CardProtocol {
        var found:CardProtocol!
        for card:CardProtocol in self.cards {
            if identifier == card.identifier {
                found = card
                break
            }
        }
        return found
    }
    
    func hasCardWith(identifier:String) -> Bool {
        for card:CardProtocol in self.cards {
            if identifier == card.identifier {
                return true
            }
        }
        return false
    }
}
