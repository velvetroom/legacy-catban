import Foundation

extension Deserialiser {
    func parseColumnsWith(dictionary:[String:Any]) throws -> [ProjectColumn] {
        guard
            let array:[Any] = dictionary[Serialiser.Constants.Project.columns] as? [Any]
        else {
            throw ErrorRepository.malformedData
        }
        return try self.parseColumnsWith(array:array)
    }
    
    private func parseColumnsWith(array:[Any]) throws -> [ProjectColumn] {
        var columns:[ProjectColumn] = []
        for item:Any in array {
            let column:ProjectColumn = try self.parseColumnWith(item:item)
            columns.append(column)
        }
        return columns
    }
    
    private func parseColumnWith(item:Any) throws -> ProjectColumn {
        guard
            let rawColumn:[String:Any] = item as? [String:Any]
        else {
            throw ErrorRepository.malformedData
        }
        return try self.parseColumnWith(dictionary:rawColumn)
    }
    
    private func parseColumnWith(dictionary:[String:Any]) throws -> ProjectColumn {
        guard
            let name:String = dictionary[Serialiser.Constants.Column.name] as? String
        else {
            throw ErrorRepository.malformedData
        }
        let column:ProjectColumn = ProjectColumn()
        column.name = name
        column.cards = try self.parseCardsWith(dictionary:dictionary)
        return column
    }
}
