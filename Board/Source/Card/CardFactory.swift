import Foundation

public class CardFactory {
    public class func newCard() -> CardProtocol {
        var card:CardProtocol = blankCard()
        card.identifier = UUID().uuidString
        card.created = Date.timestamp
        return card
    }
    
    public class func blankCard() -> CardProtocol {
        return Card()
    }
    
    private init() { }
}
