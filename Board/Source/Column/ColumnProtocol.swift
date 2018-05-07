import Foundation

public protocol ColumnProtocol:IdentifierProtocol, CreatedProtocol, ColumnCardsProtocol {
    var name:String { get set }
}
