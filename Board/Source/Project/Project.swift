import Foundation

class Project:ProjectProtocol, Equatable {
    var identifier:String
    var name:String
    var columns:[ColumnProtocol]
    var created:Int
    
    var countColumns:Int {
        get {
            return self.columns.count
        }
    }
    
    var countCards:Int {
        get {
            var counter:Int = 0
            self.columns.forEach { (column:ColumnProtocol) in
                counter += column.countCards
            }
            return counter
        }
    }
    
    init() {
        self.identifier = String()
        self.name = String()
        self.columns = []
        self.created = 0
    }
    
    func copy(project:ProjectProtocol) {
        self.identifier = project.identifier
        self.name = project.name
        self.created = project.created
        self.columns = self.columnsFrom(project:project)
    }
    
    func add(column:ColumnProtocol) {
        guard
            column.identifier.isEmpty == false
        else { return }
        self.columns.append(column)
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
    
    func cardWith(identifier:String) -> CardProtocol? {
        for column:ColumnProtocol in self.columns {
            if let card:CardProtocol = column.cardWith(identifier:identifier) {
                return card
            }
        }
        return nil
    }
    
    private func columnsFrom(project:ProjectProtocol) -> [ColumnProtocol] {
        var columns:[ColumnProtocol] = []
        project.iterate { (column:ColumnProtocol) in
            columns.append(column)
        }
        return columns
    }
    
    static func == (lhs:Project, rhs:Project) -> Bool {
        return rhs.equals(model:lhs)
    }
}
