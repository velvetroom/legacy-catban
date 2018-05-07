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
    
    class func newEditProjectCard() -> CardProtocol {
        var card:CardProtocol = newCard()
        card.content = String.localized(key:"CardFactory_newEditProjectCard_content")
        return card
    }
    
    class func newCheckStatsCard() ->  CardProtocol {
        var card:CardProtocol = newCard()
        card.content = String.localized(key:"CardFactory_newCheckStatsCard_content")
        return card
    }
}
