import Foundation

class PresenterFactory {
    static var columnLoaderType:PresenterColumnProtocol.Type = PresenterColumn.self
    static var cardLoaderType:PresenterCardProtocol.Type = PresenterCard.self
    static var newCardLoaderType:PresenterItemProtocol.Type = PresenterNewCard.self
    
    class func makeColumnLoader() -> PresenterColumnProtocol {
        return columnLoaderType.init()
    }
    
    class func makeCardLoader() -> PresenterCardProtocol {
        return cardLoaderType.init()
    }
    
    class func makeNewCardLoader() -> PresenterItemProtocol {
        return newCardLoaderType.init()
    }
}
