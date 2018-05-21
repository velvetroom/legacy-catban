import Foundation

public struct OrderColumn {
    var identifier:String
    var cards:[OrderCard]
    
    init() {
        self.identifier = String()
        self.cards = []
    }
}
