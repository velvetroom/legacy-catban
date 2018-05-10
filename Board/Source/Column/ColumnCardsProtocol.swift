import Foundation

public protocol ColumnCardsProtocol {
    func add(card:CardProtocol)
    func remove(card:CardProtocol)
    func iterate(cards:((CardProtocol) -> Void))
}
