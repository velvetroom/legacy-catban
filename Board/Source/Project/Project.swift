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
    
    init() {
        self.identifier = String()
        self.name = String()
        self.columns = []
        self.created = 0
    }
    
    func copy(project:ProjectProtocol) {
        self.identifier = project.identifier
        self.created = project.created
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
    
    static func == (lhs:Project, rhs:Project) -> Bool {
        return rhs.equals(model:lhs)
    }
}
