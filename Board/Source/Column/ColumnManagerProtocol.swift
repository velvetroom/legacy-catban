import Foundation

public protocol ColumnManagerProtocol {
    var countColumns:Int { get }
    
    func add(column:ColumnProtocol)
    func remove(column:ColumnProtocol)
    func iterate(columns:((ColumnProtocol) -> Void))
    func columnWith(identifier:String) -> ColumnProtocol
}