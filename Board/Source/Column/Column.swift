import Foundation

class Column:ColumnProtocol, Equatable {
    weak var container:ContainerProtocol?
    var identifier:String
    var name:String
    var cards:[CardProtocol]
    var created:Int
    var countCards:Int {
        get {
            return self.cards.count
        }
    }
    
    init() {
        self.identifier = String()
        self.name = String()
        self.cards = []
        self.created = 0
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
    
    func cardWith(identifier:String) -> CardProtocol? {
        for card:CardProtocol in self.cards {
            if identifier == card.identifier {
                return card
            }
        }
        return nil
    }
    
    static func == (lhs:Column, rhs:Column) -> Bool {
        return rhs.equals(model:lhs)
    }
}
