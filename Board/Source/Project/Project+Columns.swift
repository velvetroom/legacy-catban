import Foundation

extension Project {
    var countColumns:Int {
        get {
            return self.columns.count
        }
    }
    
    var mapColumns:[String:ColumnProtocol] {
        get {
            var map:[String:ColumnProtocol] = [:]
            self.columns.forEach { (column:ColumnProtocol) in
                map[column.identifier] = column
            }
            return map
        }
    }
    
    func add(column:ColumnProtocol) {
        guard
            column.identifier.isEmpty == false
        else { return }
        var column:ColumnProtocol = column
        self.columns.append(column)
        column.container = self
    }
    
    func remove(column:ColumnProtocol) {
        let countColumns:Int = self.columns.count
        for index:Int in 0 ..< countColumns {
            let item:ColumnProtocol = self.columns[index]
            if column.identifier == item.identifier {
                self.columns.remove(at:index)
                break
            }
        }
    }
    
    func iterate(columns:((ColumnProtocol) -> Void)) {
        self.columns.forEach(columns)
    }
    
    func columnsFrom(project:ProjectProtocol) -> [ColumnProtocol] {
        var columns:[ColumnProtocol] = []
        project.iterate { (column:ColumnProtocol) in
            columns.append(column)
        }
        return columns
    }
    
    func columnWith(identifier:String) -> ColumnProtocol {
        var found:ColumnProtocol!
        for column:ColumnProtocol in self.columns {
            if column.identifier == identifier {
                found = column
                break
            }
        }
        return found
    }
}
