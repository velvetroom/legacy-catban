import Foundation

public protocol ColumnProtocol:class, IdentifierProtocol, CreatedProtocol, ColumnCardsProtocol {
    var name:String { get set }
}
