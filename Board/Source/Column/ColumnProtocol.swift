import Foundation

public protocol ColumnProtocol:class,
    IdentifierProtocol,
    CreatedProtocol,
    ColumnCardsProtocol,
    CardManagerProtocol {
    var name:String { get set }
}
