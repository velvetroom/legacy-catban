import Foundation

extension Deserialiser {
    func deserialise(project:Data) throws -> ProjectProtocol {
        let rawProject:[String:Any] = try self.dictionaryFrom(data:project)
        return try self.parse(dictionary:rawProject)
    }
    
    private func parse(dictionary:[String:Any]) throws -> ProjectProtocol {
        var project:ProjectProtocol = try self.parseProjectWith(dictionary:dictionary)
        project.columns = try self.parseColumnsWith(dictionary:dictionary)
        return project
    }
    
    private func parseProjectWith(dictionary:[String:Any]) throws -> ProjectProtocol {
        guard
            let identifier:String = dictionary[Serialiser.Constants.Project.identifier] as? String,
            let name:String = dictionary[Serialiser.Constants.Project.name] as? String
        else {
            throw ErrorRepository.malformedData
        }
        let project:Project = Project()
        project.identifier = identifier
        project.name = name
        return project
    }
    
    private func parseColumnsWith(dictionary:[String:Any]) throws -> [ProjectColumn] {
        guard
            let rawColumns:[Any] = dictionary[Serialiser.Constants.Project.columns] as? [Any]
        else {
            throw ErrorRepository.malformedData
        }
        let columns:[ProjectColumn] = []
        return columns
    }
}
