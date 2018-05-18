import Foundation

class PresenterFactory {
    class func makeFor(viewModel:ViewModelProtocol) -> PresenterItemProtocol {
        let identifier:ObjectIdentifier = ObjectIdentifier(type(of:viewModel))
        let updaterType:PresenterItemProtocol.Type = identifierMap[identifier]!
        return updaterType.init()
    }
    
    private static var identifierMap:[ObjectIdentifier:PresenterItemProtocol.Type] {
        get {
            let identifierCard:ObjectIdentifier = ObjectIdentifier(ViewModelCard.self)
            let identifierNewCard:ObjectIdentifier = ObjectIdentifier(ViewModelNewCard.self)
            return [
                identifierCard:PresenterCard.self,
                identifierNewCard:PresenterNewCard.self]
        }
    }
}
