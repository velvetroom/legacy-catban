import Foundation
@testable import catban

class MockDeserialiserProtocol:DeserialiserProtocol {
    var onDeserialiseUser:((Data) -> Void)?
    var onDeserialiseProject:((Data) -> Void)?
    var throwError:Error?
    var user:UserProtocol
    var project:ProjectProtocol
    
    init() {
        self.user = User()
        self.project = Project()
    }
    
    func deserialise(user:Data) throws -> UserProtocol {
        self.onDeserialiseUser?(user)
        if let throwError:Error = self.throwError {
            throw throwError
        }
        return self.user
    }
    
    func deserialise(project:Data) throws -> ProjectProtocol {
        self.onDeserialiseProject?(project)
        if let throwError:Error = self.throwError {
            throw throwError
        }
        return self.project
    }
}
