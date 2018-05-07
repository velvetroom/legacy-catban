import Foundation

public protocol ProjectColumnsProtocol {
    var countColumns:Int { get }
    
    func add(column:ColumnProtocol)
}
