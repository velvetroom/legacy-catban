import Foundation

extension Deserialiser {
    func deserialise(user:Data) throws -> UserProtocol {
        let rawUser:[String:Any] = try self.dictionaryFrom(data:user)
        return try self.parse(dictionary:rawUser)
    }
    
    private func parse(dictionary:[String:Any]) throws -> UserProtocol {
        var user:UserProtocol = try self.parseUserWith(dictionary:dictionary)
        user.project = try self.parseProjectWith(dictionary:dictionary)
        return user
    }
    
    private func parseUserWith(dictionary:[String:Any]) throws -> UserProtocol {
        guard
            let identifier:String = dictionary[Serialiser.Constants.User.identifier] as? String
        else { throw ErrorRepository.malformedData }
        let user:User = User()
        user.identifier = identifier
        return user
    }
    
    private func parseProjectWith(dictionary:[String:Any]) throws -> ProjectProtocol {
        guard
            let identifier:String = dictionary[Serialiser.Constants.User.projectIdentifier] as? String
        else { throw ErrorRepository.malformedData }
        let project:Project = Project()
        project.identifier = identifier
        return project
    }
}
