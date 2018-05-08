import Foundation

public protocol ProjectColumnsProtocol {
    var countColumns:Int { get }
    
    func columnAt(index:Int) -> ColumnProtocol
    func add(column:ColumnProtocol)
    func remove(column:ColumnProtocol)
    func iterate(columns:((ColumnProtocol) -> Void))
}
