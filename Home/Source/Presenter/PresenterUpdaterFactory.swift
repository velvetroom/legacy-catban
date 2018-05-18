import Foundation

class PresenterUpdaterFactory {
    class func makeFor(viewModel:ViewModelBoardItemProtocol) -> PresenterUpdaterBoardItemProtocol {
        let identifier:ObjectIdentifier = ObjectIdentifier(type(of:viewModel))
        let updaterType:PresenterUpdaterBoardItemProtocol.Type = identifierMap[identifier]!
        return updaterType.init()
    }
    
    private static var identifierMap:[ObjectIdentifier:PresenterUpdaterBoardItemProtocol.Type] {
        get {
            let identifierCard:ObjectIdentifier = ObjectIdentifier(ViewModelCard.self)
            let identifierNewCard:ObjectIdentifier = ObjectIdentifier(ViewModelNewCard.self)
            return [
                identifierCard:PresenterUpdaterCard.self,
                identifierNewCard:PresenterUpdaterNewCard.self]
        }
    }
}
