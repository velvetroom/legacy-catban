import Foundation

public protocol ColumnCardsProtocol {
    func hasCardWith(identifier:String) -> Bool
    func iterate(cards:((CardProtocol) -> Void))
}
