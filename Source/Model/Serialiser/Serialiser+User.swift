import Foundation

extension Serialiser {
    func serialise(user:UserProtocol) throws -> Data {
        let dictionary:[String:Any] = self.dictionaryWith(user:user)
        return try self.dataFrom(dictionary:dictionary)
    }
    
    func dictionaryWith(user:UserProtocol) -> [String:Any] {
        var dictionary:[String:Any] = [:]
        dictionary[Constants.User.identifier] = user.identifier
        dictionary[Constants.User.projectIdentifier] = user.project.identifier
        return dictionary
    }
}
