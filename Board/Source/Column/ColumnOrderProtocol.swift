import Foundation

public protocol ColumnOrderProtocol {
    func orderWith(order:OrderColumn, and cards:[String:CardProtocol])
}
