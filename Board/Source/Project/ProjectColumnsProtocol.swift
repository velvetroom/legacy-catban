import Foundation

public protocol ProjectColumnsProtocol {
    var countColumns:Int { get }
    var countCards:Int { get }
    
    func add(column:ColumnProtocol)
    func remove(column:ColumnProtocol)
    func iterate(columns:((ColumnProtocol) -> Void))
}
