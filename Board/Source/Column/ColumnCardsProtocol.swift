import Foundation

public protocol ColumnCardsProtocol {
    var countCards:Int { get }
    
    func add(card:CardProtocol)
    func remove(card:CardProtocol)
    func iterate(cards:((CardProtocol) -> Void))
}
