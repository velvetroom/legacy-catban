import Foundation

public class CardFactory {
    public class func newCard() -> CardProtocol {
        var card:CardProtocol = Card()
        card.identifier = UUID().uuidString
        card.created = Date.timestamp
        return card
    }
}
