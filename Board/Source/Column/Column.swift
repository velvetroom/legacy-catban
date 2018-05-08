import Foundation

class Column:ColumnProtocol, Equatable {
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
        self.cards.append(card)
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
    
    func cardAt(index:Int) -> CardProtocol {
        return self.cards[index]
    }
    
    func iterate(cards:((CardProtocol) -> Void)) {
        self.cards.forEach(cards)
    }
    
    static func == (lhs:Column, rhs:Column) -> Bool {
        return rhs.equals(model:lhs)
    }
}
