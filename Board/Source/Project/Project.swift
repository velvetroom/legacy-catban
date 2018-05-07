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
    
    static func == (lhs:Project, rhs:Project) -> Bool {
        return rhs.equals(model:lhs)
    }
}
