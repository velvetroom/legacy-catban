import Foundation

public protocol ColumnCardsProtocol {
    var countCards:Int { get }
    
    func cardAt(index:Int) -> CardProtocol
    func add(card:CardProtocol)
    func remove(card:CardProtocol)
}
