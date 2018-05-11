import Foundation

public protocol ColumnCardsProtocol {
    func hasCardWith(identifier:String) -> Bool
    func add(card:CardProtocol)
    func iterate(cards:((CardProtocol) -> Void))
}
