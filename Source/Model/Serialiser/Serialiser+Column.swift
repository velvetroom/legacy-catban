import Foundation

extension Serialiser {
    func columnArrayWith(project:ProjectProtocol) -> [Any] {
        var array:[Any] = []
        for column:ProjectColumn in project.columns {
            let item:[String:Any] = self.dictionaryWith(column:column)
            array.append(item)
        }
        return array
    }
    
    private func dictionaryWith(column:ProjectColumn) -> [String:Any] {
        var dictionary:[String:Any] = [:]
        dictionary[Constants.Column.identifier] = column.identifier
        dictionary[Constants.Column.name] = column.name
        dictionary[Constants.Column.cards] = []
        return dictionary
    }
}
