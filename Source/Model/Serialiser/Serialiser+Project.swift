import Foundation

extension Serialiser {
    func serialise(project:ProjectProtocol) throws -> Data {
        let dictionary:[String:Any] = self.dictionaryWith(project:project)
        return try self.dataFrom(dictionary:dictionary)
    }
    
    func dictionaryWith(project:ProjectProtocol) -> [String:Any] {
        var dictionary:[String:Any] = [:]
        dictionary[Constants.Project.identifier] = project.identifier
        dictionary[Constants.Project.name] = project.name
        dictionary[Constants.Project.columns] = []
        return dictionary
    }
}
